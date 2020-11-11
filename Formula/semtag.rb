class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning."
  homepage "https://github.com/1efty/semtag"
  version "0.0.6"
  url "https://github.com/1efty/semtag/archive/v0.0.6.tar.gz"
  sha256 "95cee2c511fba421364ac0ca68816522cf6e8adc8e87b3090b8e460d93a1c92f"
  license "MIT"
  head "https://github.com/semtag/semtag.git"

  livecheck do
    url "https://github.com/1efty/semtag/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go@1.15" => :build

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
