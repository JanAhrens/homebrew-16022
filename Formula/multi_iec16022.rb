class MultiIec16022 < Formula
  desc "Archiving cryptographic secrets on paper"
  homepage "https://lab.whitequark.org/notes/2016-08-24/archiving-cryptographic-secrets-on-paper/"
  url "https://lab.whitequark.org/files/multi_iec16022.py"
  version "0.1"
  sha256 "ceb0b5beb3124f8df8c2f0504eb651e427983fd3a92f5f5e03ee66ecef91bd8d"

  depends_on "iec16022"
  depends_on "python3"

  def install
    chmod "+x", "multi_iec16022.py"
    mkdir bin
    cp "multi_iec16022.py", "#{bin}/multi_iec16022"
  end

  test do
    system "false"
  end
end
