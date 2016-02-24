# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/rebel_legion/version'

Gem::Specification.new do |spec|
  spec.name          = "rebel_legion"
  spec.version       = RebelLegion::VERSION
  spec.authors       = ["shinyrachel"]
  spec.email         = ["rachel.kory@gmail.com"]
  spec.summary       = "Rebel Legion costume standards viewer"
  spec.description   = "Provides details on membership costume standards for the Rebel Legion Star Wars 'good guys' costuming organization"
  spec.homepage      = "https://github.com/shinyrachel/rebel_legion"
  spec.license       = "MIT"
  spec.executables   << "rebel_legion"
  spec.files         = "git ls-files".split($\)
  spec.require_paths = ["lib"]
  spec.bindir        = 'bin'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri", ">= 0"
  spec.add_dependency "colorize", ">= 0"
end
