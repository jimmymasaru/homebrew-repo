class IbooksAnnotationsExporter < Formula
  desc "iBooks Annotations Exporter"
  homepage "https://github.com/jimmymasaru/ibooks-annotations-exporter"
  url "https://github.com/jimmymasaru/ibooks-annotations-exporter.git",
    :tag => "1.0.0"
  version "1.0.0"

  def install
    bin.install "ibooksnotes"
  end

  def post_install
    ohai "Run 'ibooksnotes'."
  end
end
