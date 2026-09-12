# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# Release automation proposes version/checksum changes through a protected PR.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://tokito.dev"
  url "https://github.com/TokitoAI/homebrew-tokito/releases/download/v0.0.15/tokito-v0.0.15-macos-universal.tar.gz"
  sha256 "b54a71d615a61446eed64d8d316cb93adbc8be5409cce4cce2d63d0452ae4760"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
