class Ezasm < Formula
  desc "An assembly-like programming language for use in education"
  homepage "https://github.com/ezasm-org/EzASM"
  url "https://github.com/michaelschuff/EzASM/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "43df4b64b635accff6b8057d0f8cf5d931883361813d2ff31175331768f5bb0c"
  license "MIT"

  depends_on "maven" => :build
  depends_on "openjdk@17"

  def install
    system "mvn", "compile", "assembly:single"
    libexec.install "target/EzASM-#{version}-beta-full.jar"
    bin.write_jar_script libexec/"ezasm-0.0.2.jar", "ezasm", java_version: "17"
  end

  test do
    system "#{bin}/ezasm", "--version"
  end
end