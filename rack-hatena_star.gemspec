# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/hatena_star/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-hatena_star"
  spec.version       = Rack::HatenaStar::VERSION
  spec.authors       = ["Kenichi TAKAHASHI"]
  spec.email         = ["kenichi.taka@gmail.com"]

  spec.summary       = %q{Rack Middleware for Hatena star.}
  spec.description   = %q{Rack Middleware for Hatena star.}
  spec.homepage      = "https://github.com/kenchan/rack-hatena_star"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
