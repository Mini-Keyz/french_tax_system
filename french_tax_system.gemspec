# frozen_string_literal: true

require_relative "lib/french_tax_system/version"

Gem::Specification.new do |spec|
  spec.name          = "french_tax_system"
  spec.version       = FrenchTaxSystem::VERSION
  spec.authors       = ["Mathieu EUSTACHY"]
  spec.email         = ["mathieu.eustachy@gmail.com"]

  spec.summary       = "A gem that replicates french tax system"
  spec.description   = "This gem will allow you to generate some features of the French tax system that can be very annoying to code"
  spec.homepage      = "https://github.com/Mth0158/french_tax_system"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "http://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Mth0158/french_tax_system"
  spec.metadata["changelog_uri"] = "https://github.com/Mth0158/french_tax_system/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
