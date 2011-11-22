# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metronome/version"

Gem::Specification.new do |s|
  s.name        = "metronome"
  s.version     = Metronome::VERSION
  s.authors     = ["Jorge Luis Pérez"]
  s.email       = ["jolisper@gmail.com"]
  s.homepage    = "https://github.com/jolisper/metronome"
  s.summary     = %q{command-line metronome}
  s.description = %q{command-line metronome}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"

  s.add_runtime_dependency "rubygame"
  s.add_runtime_dependency "ruby-sdl-ffi"
end
