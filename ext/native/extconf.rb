require "mkmf"
require "pathname"

root = Pathname(File.expand_path("../../../", __FILE__))
ext = root.join("ext/native")
vendor = root.join("vendor")

Dir.chdir(vendor.join("seq2gif")) do
  patch = ext.join("0001-make-libseq2gif.patch")
  system "patch -N -R --dry-run --silent  Makefile.in < #{patch} || patch Makefile.in < #{patch}"
  system "CFLAGS=-fPIC ./configure && make libseq2gif.a"
end

LIBDIR     = RbConfig::CONFIG["libdir"]
INCLUDEDIR = RbConfig::CONFIG["includedir"]
HEADER_DIRS = [vendor.to_s, INCLUDEDIR]
dir_config("seq2gif", vendor.to_s, vendor.join("seq2gif").to_s)

libs = ["-lseq2gif"]
libs.each { |lib| $LOCAL_LIBS << "#{lib} " }

create_makefile "seq2gif/native"
