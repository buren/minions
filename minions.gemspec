# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minions/version'

Gem::Specification.new do |spec|
  spec.name          = 'minions'
  spec.version       = Minions::VERSION
  spec.authors       = ['Jacob Burenstam']
  spec.email         = ['burenstam@gmail.com']

  spec.summary       = %q{Do things in parallel.}
  spec.homepage      = 'https://github.com/buren/minions'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
