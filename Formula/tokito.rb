# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# Release automation proposes version/checksum changes through a protected PR.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://github.com/TokitoAI/tokito"
  url "https://github.com/TokitoAI/tokito/releases/download/v0.0.10/tokito-v0.0.10-macos-universal.tar.gz"
  sha256 "e3b9eb42dc7a98292009d482087c2c9ba333d91258076729b345ea0069c922fe"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
