require "pathname"
begin
  require "bacon"
rescue LoadError
  require "rubygems"
  require "bacon"
end

begin
  if (local_path = Pathname.new(__FILE__).dirname.join("..", "lib", "djbdns_namecoin.rb")).file?
    require local_path
  else
    require "djbdns_namecoin"
  end
rescue LoadError
  require "rubygems"
  require "djbdns_namecoin"
end

Bacon.summary_on_exit

describe "Spec Helper" do
  it "Should bring our library namespace in" do
    DjbdnsNamecoin.should == DjbdnsNamecoin
  end
end


