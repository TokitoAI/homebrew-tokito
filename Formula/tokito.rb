# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# This file is mirrored to https://github.com/TokitoAI/homebrew-tokito.
# Until the release workflow opens an auto-PR (later slice), update the
# `url`, `sha256`, and `version` lines by hand after each GitHub Release,
# then push the change to the tap.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://github.com/TokitoAI/tokito"
  url "https://github.com/TokitoAI/tokito/releases/download/v0.0.5/tokito-v0.0.5-macos-universal.tar.gz"
  version "0.0.5"
  sha256 "8b644cf9bdd745876d3ba3d8c701241696bd5d82cfe9004b38d25cde7693baa1"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end