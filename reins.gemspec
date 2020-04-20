# frozen_string_literal: true

require_relative 'lib/reins/version'

Gem::Specification.new do |spec|
  spec.name          = 'reins'
  spec.version       = Reins::VERSION
  spec.authors       = ['Rein Van Imschoot']
  spec.email         = ['reinvanimschoot@gmail.com']

  spec.summary       = 'A Rack-based Web Framework'
  spec.homepage      = 'https://reinvanimschoot.dev'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://reinvanimschoot.dev'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://reinvanimschoot.dev'
  spec.metadata['changelog_uri'] = 'https://reinvanimschoot.dev'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rack'
  spec.add_runtime_dependency 'erubis'
  spec.add_runtime_dependency 'multi_json'
end
