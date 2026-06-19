# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# This file is mirrored to https://github.com/VtronTokito/homebrew-tokito.
# Until the release workflow opens an auto-PR (later slice), update the
# `url`, `sha256`, and `version` lines by hand after each GitHub Release,
# then push the change to the tap.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://github.com/VtronTokito/tokito"
  url "https://github.com/VtronTokito/tokito/releases/download/v0.0.1-beta/tokito-v0.0.1-beta-macos-universal.tar.gz"
  version "0.0.1-beta"
  sha256 "c83870bc7a8f21b9fd35713427b8b2e0e786a82bf9d1add2343e734d4019b129"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
