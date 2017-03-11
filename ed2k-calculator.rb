class Ed2kCalculator < Formula
  desc "Ed2k Hash Calculator"
  homepage "https://github.com/jimmymasaru/ed2kcalculator"
  url "https://github.com/jimmymasaru/ed2kcalculator.git",
    :tag => "1.0.0"
    # :revision => "ab2798d0006973970735c580fdd7dec4acb4acf5"
  version "1.0.0"

  # depends_on "cmake" => :build

  def install
    dotnet="/usr/local/share/dotnet/dotnet"
    projectFile="./Ed2kCalculator/project.json"
    unless File.file?(dotnet)
      odie ".NET Core is required. Please refer to https://www.microsoft.com/net/core#macos for more info."
    end
    system dotnet, "restore", projectFile
    system dotnet, "publish", projectFile, "--configuration", "Release"
    libexec.install Dir["./Ed2kCalculator/bin/Release/netcoreapp1.0/publish/*"]
    bin.install "ed2kcalc"
  end

  def post_install
    inreplace "#{bin}/ed2kcalc", "\#destination\#", "#{opt_prefix}/libexec/Ed2kCalculator.dll"
    ohai "Run Ed2k Hash Calculator by 'ed2kcalc'."
  end

  test do
    assert File.file?("#{opt_prefix}/libexec/Ed2kCalculator.dll")
  end
end

# https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
# http://deeeet.com/writing/2014/05/20/brew-tap/
# http://stackoverflow.com/questions/22272176/making-a-homebrew-formula
# http://stackoverflow.com/questions/8590098/how-to-check-for-file-existence
