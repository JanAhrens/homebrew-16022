class Iec16022 < Formula
  desc "DataMatrix 2D barcode generator"
  homepage "http://rdoeffinger.github.io"
  url "https://github.com/rdoeffinger/iec16022/archive/v0.2.7.tar.gz"
  sha256 "34f00da5f6c83dd14b2803e5ed0f5310310e452023fe989c59fc5489b78cd33a"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "popt" => :build
  depends_on "lzlib" => :build

  def install
    # On macOS malloc is located in <sys/malloc.h>
    # https://github.com/Homebrew/homebrew-science/blob/bf15f7c1bb2449c08968e2af24f6e0aa44dc9be1/lp_solve.rb#L101
    inreplace "iec16022.c", "#include <malloc.h>", "#include <sys/malloc.h>"
    inreplace "image.c", "#include <malloc.h>", "#include <sys/malloc.h>"
    inreplace "iec16022ecc200.c", "#include <malloc.h>", "#include <sys/malloc.h>"

    # remove unsupported linker flags
    inreplace "Makefile.am", "--as-needed", ""
    inreplace "Makefile.am", "--no-undefined", ""

    # homebrew prefixes a "g" to prevent conflicts with the macos native libtool
    inreplace "autogen.sh", "libtoolize", "glibtoolize"

    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/iec16022", "--help"
  end
end
