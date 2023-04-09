class Ezasm < Formula
  desc "An assembly-like programming language for use in education"
  homepage "https://github.com/ezasm-org/EzASM"
  url "https://github.com/michaelschuff/EzASM/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "7bd482af01f44dfa2a76b3a643644f7fbf8a5843937bec1873c566af66e45c25"
  license "MIT"

  depends_on "maven" => :build
  depends_on "openjdk@17"

  def install
    system "mvn", "compile", "assembly:single"
    system "echo", "'hi'"
  end

  test do
    system "#{bin}/ezasm", "--version"
  end
end