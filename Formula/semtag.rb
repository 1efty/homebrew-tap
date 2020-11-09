class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning."
  homepage "https://github.com/1efty/semtag"
  version "0.0.5"
  url "https://github.com/1efty/semtag/archive/v0.0.5.tar.gz"
  sha256 "96eec81d7358c53546e30d9181c4e9b0c88695b5cb502e61e935e9850b4d72a8"
  license "MIT"
  head "https://github.com/semtag/semtag.git"

  livecheck do
    url "https://github.com/1efty/semtag/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go@1.15" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args, "-ldflags", "-s -w", "-mod=vendor"
  end

  test do
    system "#{bin}/semtag"
  end
end
