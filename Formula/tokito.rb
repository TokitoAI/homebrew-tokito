# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# Release automation proposes version/checksum changes through a protected PR.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://github.com/TokitoAI/tokito"
  url "https://github.com/TokitoAI/tokito/releases/download/v0.0.11/tokito-v0.0.11-macos-universal.tar.gz"
  sha256 "9e417d2de8b5a37d1a64c3dd36c25e764420de5f4e4e9844f27eeaae3a61884e"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
