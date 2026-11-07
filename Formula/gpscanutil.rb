# Template for the formula in https://github.com/multi-io/homebrew-tap,
# filled in by render-formula.sh during the release workflow.
class Gpscanutil < Formula
  desc "Analyze and compare GrandPerspective disk usage scan files"
  homepage "https://github.com/multi-io/gpscanutil"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.2/gpscanutil_0.1.2_darwin_arm64.tar.gz"
      sha256 "a46878181a528532ff6326b4481b4e944af6493d2a5e776eca1c04fbe283aeb5"
    end
    on_intel do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.2/gpscanutil_0.1.2_darwin_amd64.tar.gz"
      sha256 "d329819adf4d3053be5b5ec180d62525c23d5d830c8f22ced9f2263f0e06c624"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.2/gpscanutil_0.1.2_linux_arm64.tar.gz"
      sha256 "52162c128c761a57b6bdf62746ebd4cd3a8e556a835ada5c4025124504830bbb"
    end
    on_intel do
      url "https://github.com/multi-io/gpscanutil/releases/download/v0.1.2/gpscanutil_0.1.2_linux_amd64.tar.gz"
      sha256 "f790a3debaca318f4b5c931c621a6a010a840e2cf2d871022bac29b831207a6b"
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
