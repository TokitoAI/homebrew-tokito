#!/usr/bin/env python3
"""Verify the formula against the immutable release archive and checksum sidecar."""

from __future__ import annotations

import hashlib
import io
import re
import tarfile
import urllib.request
from pathlib import Path, PurePosixPath

FORMULA = Path(__file__).parents[1] / "Formula" / "tokito.rb"
MAX_ARCHIVE_BYTES = 100 * 1024 * 1024
FIELD = {
    name: re.compile(rf'^\s*{name}\s+"([^"]+)"\s*$', re.MULTILINE)
    for name in ("url", "sha256")
}
RELEASE_URL = re.compile(
    r"https://github\.com/TokitoAI/tokito/releases/download/v(?P<version>[0-9]+\.[0-9]+\.[0-9]+)/"
    r"tokito-v(?P=version)-macos-universal\.tar\.gz"
)


def fetch(url: str) -> bytes:
    request = urllib.request.Request(url, headers={"User-Agent": "Tokito-Homebrew-CI/1"})
    with urllib.request.urlopen(request, timeout=60) as response:
        if response.status != 200:
            raise ValueError(f"download failed with HTTP {response.status}")
        declared = response.headers.get("Content-Length")
        if declared is not None and int(declared) > MAX_ARCHIVE_BYTES:
            raise ValueError("release asset exceeds the download limit")
        payload = response.read(MAX_ARCHIVE_BYTES + 1)
    if len(payload) > MAX_ARCHIVE_BYTES:
        raise ValueError("release asset exceeds the download limit")
    return payload


def fields() -> dict[str, str]:
    source = FORMULA.read_text(encoding="utf-8")
    values: dict[str, str] = {}
    for name, pattern in FIELD.items():
        matches = pattern.findall(source)
        if len(matches) != 1:
            raise ValueError(f"formula must contain exactly one {name}")
        values[name] = matches[0]
    match = RELEASE_URL.fullmatch(values["url"])
    if match is None or re.fullmatch(r"[0-9a-f]{64}", values["sha256"]) is None:
        raise ValueError("formula release identity is inconsistent")
    values["version"] = match.group("version")
    return values


def verify() -> None:
    values = fields()
    archive = fetch(values["url"])
    sidecar = fetch(values["url"] + ".sha256")
    words = sidecar.decode("ascii").strip().split()
    if len(words) != 2 or words[0] != values["sha256"] or words[1] != Path(values["url"]).name:
        raise ValueError("checksum sidecar is inconsistent")
    if hashlib.sha256(archive).hexdigest() != values["sha256"]:
        raise ValueError("release archive checksum mismatch")
    with tarfile.open(fileobj=io.BytesIO(archive), mode="r:gz") as bundle:
        members = bundle.getmembers()
        normalized = {member.name.removeprefix("./") for member in members}
        if "tokito" not in normalized or not {"LICENSE", "README.md"} <= normalized:
            raise ValueError("release archive is missing required files")
        for member in members:
            path = PurePosixPath(member.name)
            if path.is_absolute() or ".." in path.parts or member.issym() or member.islnk():
                raise ValueError("release archive contains an unsafe member")
    print(f"verified Tokito v{values['version']} ({len(archive)} bytes, sha256:{values['sha256']})")


if __name__ == "__main__":
    verify()
