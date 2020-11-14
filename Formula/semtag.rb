class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning"
  homepage "https://github.com/1efty/semtag"
  url "https://github.com/1efty/semtag/releases/download/"
  version "0.0.7"
  sha256 "af14354098a47c9eef478ae19c76d4a792241501b410153fc7aab45d24bebce7"
  license "MIT"
  head "https://github.com/semtag/semtag.git"

  livecheck do
    url "https://github.com/1efty/semtag/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w", "-mod=vendor"

    (bash_completion/"semtag").write `#{bin}/semtag completion bash`
    (zsh_completion/"_semtag").write `#{bin}/semtag completion zsh`
    (fish_completion/"semtag.fish").write `#{bin}/semtag completion fish`
  end

  test do
    system "#{bin}/semtag"
  end
end
