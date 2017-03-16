class IbooksAnnotationsExporter < Formula
  desc "iBooks Annotations Exporter"
  homepage "https://github.com/jimmymasaru/ibooksannotationsexporter"
  url "https://github.com/jimmymasaru/ibooksannotationsexporter.git",
    :tag => "1.0.0"
  version "1.0.0"

  def install
    bin.install "ibooksnotes"
  end

end
