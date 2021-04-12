class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning"
  homepage "https://github.com/1efty/semtag"
  url "https://github.com/1efty/semtag/archive/v0.0.10.tar.gz"
  sha256 "0660ed11c2ff858e1c1e1633a2b52ff42e82a30db995ac207b01c61ef94b0ce7"
  license "MIT"
  head "https://github.com/semtag/semtag.git"

  livecheck do
    url "https://github.com/1efty/semtag/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w"

    (bash_completion/"semtag").write `#{bin}/semtag completion bash`
    (zsh_completion/"_semtag").write `#{bin}/semtag completion zsh`
    (fish_completion/"semtag.fish").write `#{bin}/semtag completion fish`
  end

  test do
    system "#{bin}/semtag"
  end
end
