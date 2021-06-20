require "language/node"

class IdsTools < Formula
  desc "IDS (Ideographic Description Sequence) Tools"
  homepage "https://github.com/jimmymasaru/ids-tools/"
  url "https://github.com/jimmymasaru/ids-tools.git",
    :tag => "1.1.0"
  version "1.1.0"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    opoo "Initializing local IDS database. This could take a few minutes."
    system "./idsdictgen", "data/ids/ids-cdp.txt", "--char", "data/ids-cdp-dict.txt", "--comp", "data/ids-cdp-comp.txt"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"idsquery"
  end

  test do
    assert File.file?("#{bin}/idsquery")
  end

  def post_install
    ohai "Run 'idsquery' to start using."
  end
end
