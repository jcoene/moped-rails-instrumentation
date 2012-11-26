# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "moped/rails/instrumentation/version"

Gem::Specification.new do |s|
  s.name        = "moped-rails-instrumentation"
  s.version     = Moped::Rails::Instrumentation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jason Coene"]
  s.email       = ["jcoene@gmail.com"]
  s.homepage    = "http://github.com/jcoene/moped-rails-instrumentation"
  s.summary     = %q{Records time spent in Moped for mongo and adds to request logs.}
  s.description = %q{Records time spent in Moped for mongo and adds to request logs.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
