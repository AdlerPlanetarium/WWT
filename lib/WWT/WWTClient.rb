require 'rest_client'
require 'rexml/document'
require 'WWT/WWT_layer'

include REXML

class WWTClient 
  
  attr_accessor :url, :port
  
  Default_host = "http://0.0.0.0"
  Default_port = "5050"
  
  def initialize(url=nil,port=nil)
    @url  ||= Default_host
    @port ||= Default_port
  end
  
  def  method_missing(method_name,*args)
    args ||= []
    data = args.first.delete(:data) || ""
    data = data.join(",") if data.class==Array
    args_list = make_arg_list(args.first.merge({:cmd=>method_name}))
    call_command args_list,data
  end
  
  def new_layer (*args)
    result = self.new args.first 
    return WWT_layer.new(self,result.first["newlayerid"][:content])
  end
  
  def call_command(args_list,data="")
    puts "#{@url}:#{@port}/layerApi.aspx?#{args_list}"
    puts "data is #{data}"
    parse_responce(RestClient.post "#{@url}:#{@port}/layerApi.aspx?#{args_list}", data)
    
  end
  
  def make_arg_list (args)
    args.to_a.inject(""){|str, arg| str+="&#{arg[0].to_s}=#{arg[1].to_s}"}
  end
  
  def look_at(subject)
    self.mode :lookat=>subject
  end
  
  def move(command)
    self.call_command( make_arg_list({:cmd=>:move, :move=>command}))
  end
  
  #not working just yet
  def layers 
    self.layerlist :layersonly=>true
  end
  
  def parse_responce(responce)
      puts responce
      raise "WWT error #{parse.search('h2').inner_html}"if responce.match(/Error/)
      parse = Document.new responce
      parse.elements.to_a("/LayerApi/*") {|el| el.children.map{|c| {c.name =>{:content=>c.text, :properties=>c.attributes}}}}.first
  end
    
end