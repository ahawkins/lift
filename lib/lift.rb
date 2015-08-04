require "lift/version"

module Lift
  def initialize(values = {})
    super()
    unless values.respond_to? :each_pair
      [:to_hash, :to_h].each do |hash_converter|
        break values = values.send(hash_converter) if values.respond_to? hash_converter
      end
    end
    values.each_pair do |key, value|
      send "#{key}=", value
    end
    yield self if block_given?
  end
end
