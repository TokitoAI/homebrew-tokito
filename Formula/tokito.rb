# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# Release automation proposes version/checksum changes through a protected PR.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://tokito.dev"
  url "https://github.com/TokitoAI/homebrew-tokito/releases/download/v0.0.14/tokito-v0.0.14-macos-universal.tar.gz"
  sha256 "5efff7017ccd92896c381dbff428adf33fe47cedad6b7e1667192ac07f3f188d"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
