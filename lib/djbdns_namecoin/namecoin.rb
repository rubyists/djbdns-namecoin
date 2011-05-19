module DjbdnsNamecoin
  module Namecoin
  end
end
Dir[File.dirname(__FILE__) + "/namecoin/*"].each { |f| require f }
