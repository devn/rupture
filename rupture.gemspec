# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rupture/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Justin Balthrop"]
  gem.email         = ["code@justinbalthrop.com"]
  gem.date          = "2012-06-05"
  gem.description   = %q{Clojure sequence functions for Ruby.}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/flatland/rupture"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rupture"
  gem.require_paths = ["lib"]
  gem.version       = Rupture::VERSION

  gem.add_dependency('hamster')
  gem.add_development_dependency('bundler')
  gem.add_development_dependency('simplecov')
  gem.add_development_dependency('shoulda')
  gem.add_development_dependency('mocha')
end
