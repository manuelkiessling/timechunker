$:.push File.expand_path("../lib", __FILE__)
require "timechunker/version"

Gem::Specification.new do |s|
  s.name        = "timechunker"
  s.version     = Timechunker::VERSION.dup
  s.description = "Simple class to chunk a time range into ranges of a defined size."
  s.summary     = "Simple class to chunk a time range into ranges of a defined size."
  s.author      = "Manuel Kiessling"
  s.email       = "manuel@kiessling.net"
  s.homepage    = "https://github.com/ManuelKiessling/Timechunker"

  s.rubyforge_project = "timechunker"

  s.files         = `git ls-files`.split("\n")                                          
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")                
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }   
  s.require_paths = ["lib"]   
end
