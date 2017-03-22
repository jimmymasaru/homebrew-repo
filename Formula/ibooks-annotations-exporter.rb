class IbooksAnnotationsExporter < Formula
  desc "iBooks Annotations Exporter"
  homepage "https://github.com/jimmymasaru/ibooksannotationsexporter"
  url "https://github.com/jimmymasaru/ibooksannotationsexporter.git",
    :tag => "1.0.4"
  version "1.0.4"

  def install
    bin.install "ibooksnotes"
  end

  def post_install
    ohai "Run 'ibooksnotes' for more details."
  end
end
