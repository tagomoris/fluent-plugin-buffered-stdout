# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-buffered-stdout"
  spec.version       = "0.0.1"
  spec.authors       = ["TAGOMORI Satoshi"]
  spec.email         = ["tagomoris@gmail.com"]
  spec.description   = %q{Fluentd STDOUT output plugin with buffering, for buffer plugin tests only}
  spec.summary       = %q{Buffered stdout output plugin for Fluentd}
  spec.homepage      = "https://github.com/tagomoris/fluent-plugin-buffered-stdout"
  spec.license       = "APLv2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "fluentd"
end
