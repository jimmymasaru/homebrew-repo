class FpGen < Formula
  desc "iOS Font Profile Generator"
  homepage "https://github.com/jimmymasaru/fp-gen/"
  url "https://github.com/jimmymasaru/fp-gen.git",
    :tag => "1.0.1"
  version "1.0.1"

  depends_on "node" => :run

  def install
    system "/usr/local/bin/npm", "install"
    ohai "Installing components ..."
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fpgen"
  end

  test do
    assert File.file?("#{bin}/fpgen")
  end

  def post_install
    ohai "Run 'fpgen'."
  end
end
