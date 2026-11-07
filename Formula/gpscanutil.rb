# Template for the formula in https://github.com/multi-io/homebrew-tap,
# filled in by render-formula.sh during the release workflow.
class Gpscanutil < Formula
  desc "Analyze and compare GrandPerspective disk usage scan files"
  homepage "https://github.com/multi-io/gpscanutil"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.1/gpscanutil_0.1.1_darwin_arm64.tar.gz"
      sha256 "2654eba584db7a5bc7435513b735e2a55402e458a159fe870add2a52b149cabc"
    end
    on_intel do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.1/gpscanutil_0.1.1_darwin_amd64.tar.gz"
      sha256 "151b637ba67f4d8570758dc5c29797302d62bfc1a85969de464d5b80dfbe6182"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.1/gpscanutil_0.1.1_linux_arm64.tar.gz"
      sha256 "b82081a988fd9446d5235c1dc72e6e8ef8f2fdb91533df3c77c24eddc1129578"
    end
    on_intel do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.1/gpscanutil_0.1.1_linux_amd64.tar.gz"
      sha256 "e79ce1598fed94fa3a5ca9c89892c1ddd00029379e14d1cf104c9aff99a229b7"
    end
  end

  def install
    bin.install "gpscanutil"
    generate_completions_from_executable(bin/"gpscanutil", "completion", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpscanutil version")
  end
end
