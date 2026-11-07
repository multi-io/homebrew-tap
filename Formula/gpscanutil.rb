# Template for the formula in https://github.com/multi-io/homebrew-tap,
# filled in by render-formula.sh during the release workflow.
class Gpscanutil < Formula
  desc "Analyze and compare GrandPerspective disk usage scan files"
  homepage "https://github.com/multi-io/gpscanutil"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.0/gpscanutil_0.1.0_darwin_arm64.tar.gz"
      sha256 "9049b6a4843dfb6b1b5c9d4b0a293ba86381e757d9b43ae6149a38d8f444814c"
    end
    on_intel do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.0/gpscanutil_0.1.0_darwin_amd64.tar.gz"
      sha256 "fc85c9f13f2e4642f5dcfb0ce526e5e3f798302968d974a16420db2b7125ef45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.0/gpscanutil_0.1.0_linux_arm64.tar.gz"
      sha256 "4d1a5c51320e9381835c2ae763f405b281be82bbff2f25b27099f18e1d79c399"
    end
    on_intel do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.0/gpscanutil_0.1.0_linux_amd64.tar.gz"
      sha256 "b3c0f241112018279000caa66fdf6d9d978e58ac7656498950471ca8450d6ce9"
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
