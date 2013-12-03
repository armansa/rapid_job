# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapid_job/version'

Gem::Specification.new do |spec|
  spec.name          = "rapid_job"
  spec.version       = RapidJob::VERSION
  spec.authors       = ["Arman Sarrafi"]
  spec.email         = ["arman.zrb@gmail.com"]
  spec.description   = %q{RapidJob is a RabbitMQ-backed Ruby library for creating background jobs, placing them on multiple queues, and processing them rapidly.}
  spec.summary       = %q{RabbitMQ-backed background jobs}
  spec.homepage      = "https://github.com/armansa/rapid_job"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bunny"
  spec.add_development_dependency "amqp"
  spec.add_development_dependency "json"
end
