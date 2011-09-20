class WWT_layer 
  attr_accessor :telescope ,:layer_id
  
  def initialize(telescope,layer_id)
    @telescope= telescope
    @layer_id = layer_id
  end
  
  def method_missing (method_name, *args)
    set_property(method_name.to_s.gsub("=",""),args.first) if method_name.match(/.*=/)
    get_property(method_name) if args.count==0
  end
  
  def get_property(property_name)
    puts "running get property"
    name = WWT_layer.sanitize_property_name(property_name.to_s) 
    puts "#{name}"
    result = @telescope.getprop :id=>layer_id, :propname => name
    result[1]["layer"][:properties][name.downcase]
  end
  
  def set_property(property_name,args)
    puts "running set property"
    name = WWT_layer.sanitize_property_name(property_name.to_s)
    @telescope.setprop :id => layer_id, :propname => name, :propvalue=>args
  end
  
  def update(args)
    @telescope.update args.merge(:id=>layer_id)
  end
  
  def self.sanitize_property_name(name)
    name.split("_").map{|w| w.capitalize}.join("")
  end
  
end