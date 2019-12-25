lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_extensions'
  spec.version       = RubyExtensions::VERSION
  spec.authors       = ["xiongzenghui"]
  spec.email         = ["zxcvb1234001@163.com"]

  spec.summary       = %q{include some extensions wrapper for ruby stdlib api.}
  spec.description   = %q{include some extensions wrapper for ruby stdlib api.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'toml-rb', '>= 2.0.1', '< 3.0'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
