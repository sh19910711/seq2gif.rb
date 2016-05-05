# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seq2gif/version'

Gem::Specification.new do |spec|
  spec.name          = "seq2gif"
  spec.version       = Seq2gif::VERSION
  spec.authors       = ["Hiroyuki Sano"]
  spec.email         = ["sh19910711@gmail.com"]

  spec.summary       = %q{Convert a ttyrec record into a gif animation directly (almost vt102 compatible terminal emulation).}

  spec.files         << `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  seq2gif = lambda {|f| "vendor/seq2gif/#{f}" }
  spec.files         << `cd vendor/seq2gif && git ls-files -z`.split("\x0").map(&seq2gif)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions << "ext/native/extconf.rb"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler", "~> 0.9"
end
