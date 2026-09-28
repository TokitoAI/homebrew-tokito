# Source-of-truth Homebrew formula for the Tokito desktop schematic studio.
#
# Release automation proposes version/checksum changes through a protected PR.

class Tokito < Formula
  desc "AI-assisted desktop schematic studio"
  homepage "https://tokito.dev"
  url "https://github.com/TokitoAI/homebrew-tokito/releases/download/v0.0.16/tokito-v0.0.16-macos-universal.tar.gz"
  sha256 "30101ca664a2704d7577c359ac4c55052a17daed727228c97f565d5e1c26d9ae"
  license "MIT"

  def install
    bin.install "tokito"
    pkgshare.install "assets" if Dir.exist?("assets")
  end

  test do
    assert_match "tokito", shell_output("#{bin}/tokito --version")
  end
end
