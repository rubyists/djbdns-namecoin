module DjbdnsNamecoin
  module Namecoin
    class Record
      attr_reader :json,:name,:value,:expires,:txid
      def initialize(json)
        @json = json
        @name,@value,@expires,@txid = json.values_at("name",  "value", "expires_in", "txid")
      end

      def mapping
        JSON.parse(value) rescue nil
      end

      def inspect
        "<#{self.class.name} ##{self.object_id}: #{[@name,@value,@expires,@txid]}>"
      end

      def self.get(name)
        list.select {|l| l["name"].match(name) }
      end

      def self.list
        @@list ||= JSON.parse(%x{namecoind name_scan})
      end

      def self.all
        list.map { |r| new r }
      end

      def self.clear_list
        @@list = nil
      end
    end
  end
end
