require 'formula'

class Cgminer < Formula
  homepage 'https://github.com/vthoang/cgminer'
  head 'https://github.com/vthoang/cgminer.git', :branch => 'master'
  url 'https://github.com/vthoang/cgminer/archive/495461ca3b905212f0082c2dad622f9ac7d35360.tar.gz'
  sha256 '6a93d065551bde115905037c71398b57cff0efa569bd8e229a20e3d36e598be1'
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
