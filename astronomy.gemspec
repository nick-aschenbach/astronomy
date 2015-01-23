# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'astronomy/version'

Gem::Specification.new do |spec|
  spec.name          = 'astronomy'
  spec.version       = Astronomy::VERSION
  spec.authors       = ['Nick Aschenbach']
  spec.email         = ['nick.aschenbach@gmail.com']
  spec.summary       = %q{Get information using a simple interface about various celestial phenomena from Freebase. Search or browse the data.}
  spec.description   = %q{Search or browse the names, descriptions and image URLs for various categories including: Asterism, Celestial Object, Star, Planet, Star System, Galaxy, Moon, Comet, Asteroid, Constellation, Nebula, Astronomical Discovery, Cluster and Meteor Shower. Also provides links to the full Freebase JSON data.}
  spec.homepage      = 'https://github.com/nick-aschenbach/astronomy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
