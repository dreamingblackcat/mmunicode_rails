# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mmunicode_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "mmunicode_rails"
  spec.version       = MmunicodeRails::VERSION
  spec.authors       = ["dreamingblackcat"]
  spec.email         = ["dreamingblackcat10@gmail.com"]
  spec.summary       = %q{A gem that provide converting of your rails app input contents from zawgyi to unicode(conflicted fonts in myanmar country)}
  spec.description   = %q{mmunicode_rails lets you convert you rails app input data to Myanmar Unicode regardless of which fonts the users used.}
  spec.homepage      = "https://github.com/dreamingblackcat/mmunicode_rails"
  spec.license       = "GPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~>5.0"
  spec.add_development_dependency 'activerecord', '~> 3.0'
  spec.add_development_dependency 'sqlite3', "~>1.3.5"
  spec.add_runtime_dependency 'rack', ">= 1.4.5"

end
