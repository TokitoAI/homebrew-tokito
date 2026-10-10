# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# Release automation proposes version/checksum changes through a protected PR.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://tokito.dev"
  url "https://github.com/TokitoAI/homebrew-tokito/releases/download/v0.0.17/tokito-v0.0.17-macos-universal.tar.gz"
  sha256 "1bc32cd898e67b8f96dad7891ac566c18e403ee998b1c82ab09c4f038e5a66f2"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
