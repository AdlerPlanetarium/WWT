# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "WWT/version"

Gem::Specification.new do |s|
  s.name        = "WWT"
  s.version     = Wwt::VERSION
  s.authors     = ["Start Lynn"]
  s.email       = ["stuart@zooniverse.org"]
  s.homepage    = ""
  s.summary     = %q{This is a gem that allows you to control the microsoft WWT desktop client remotely from ruby}
  s.description = %q{This gem exposes the WWT remote API(or at least most of it) to ruby. It works by sending given commands to an open port on the 
    machine running WWT.}

  s.rubyforge_project = "WWT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_dependency "rest-client"
#  s.add_dependency "hpricot"
  
end
