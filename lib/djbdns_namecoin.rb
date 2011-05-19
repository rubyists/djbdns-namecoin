require "pathname"
$LOAD_PATH.unshift(File.expand_path("../", __FILE__))

# Allows for pathnames to be easily added to
class Pathname
  def /(other)
    join(other.to_s)
  end
end

# The Djbdns Namecoin library, by tj
module DjbdnsNamecoin
  autoload :VERSION, "djbdns_namecoin/version"
  ROOT = Pathname($LOAD_PATH.first) unless DjbdnsNamecoin.const_defined?("ROOT")
  LIBDIR = ROOT/:lib unless DjbdnsNamecoin.const_defined?("LIBDIR")
end
