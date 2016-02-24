# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/rebellegion/version'

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
  spec.files         = ["config/environment", "lib/rebel_legion.rb", "lib/rebel_legion/cli.rb", "lib/rebel_legion/costume.rb", "lib/rebel_legion/costume_category.rb", "lib/rebel_legion/scraper.rb"]

  # # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "colorize", ">= 0"
end
