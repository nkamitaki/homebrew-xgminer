require 'formula'

class CgminerGekko < Formula
  homepage 'https://github.com/vthoang/cgminer'
  head 'https://github.com/vthoang/cgminer.git', :branch => 'master'
  url 'https://github.com/vthoang/cgminer/archive/495461ca3b905212f0082c2dad622f9ac7d35360.tar.gz'
  sha256 '28302239de8d62d93cb00788934d728fc569ad2bac51834bb1be69f56f859f5b'
  version "4.10.0"

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'coreutils' => :build
  depends_on 'curl'
  depends_on 'libusb'
  depends_on 'ncurses'
  depends_on 'jansson'

  def install
    system "autoreconf -fvi"
    system "./autogen.sh", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "PKG_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/curl/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/jansson/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libusb/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/ncurses/lib/pkgconfig",
                          "--enable-bflsc",
                          "--enable-bitforce",
                          "--enable-icarus",
                          "--enable-modminer",
                          "--enable-avalon",
                          "--disable-adl",
                          "--enable-opencl",
                          "--enable-bitfury",
                          "--enable-hashfast",
                          "--enable-klondike",
                          "--enable-drillbit",
                          "--enable-avalon2",
                          "--enable-blockerupter",
                          "--enable-cointerra",
                          "--enable-hashratio",
                          "--enable-gekko",
                          "--with-system-jansson"
    system "make", "install"
  end

  test do
    system "cgminer"
  end
end
