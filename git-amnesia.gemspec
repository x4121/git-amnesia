# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forgetful-git/amnesia/version'

GEM_VERSION = Amnesia::VERSION

Gem::Specification.new do |spec|
    spec.name        = 'git-amnesia'
    spec.version     = GEM_VERSION
    spec.authors     = ['Armin Grodon']
    spec.email       = ['me@armingrodon.de']

    spec.summary     = "A tool to help you recover from your post-weekend amnesia"
    spec.description = "Let someone else remember what you commited"
    spec.homepage    = 'https://github.com/x4121/git-amnesia'

    spec.executables = 'git-amnesia'
    spec.date        = '2017-01-20'
    spec.extra_rdoc_files = ['README.md']
    spec.files       = [
        "LICENSE",
        "README.md",
        "lib/forgetful-git/amnesia.rb",
        "lib/forgetful-git/amnesia/version.rb",
        "lib/forgetful-git/common/git.rb",
        "lib/forgetful-git/common/string.rb",
        "lib/forgetful-git/common/log.rb"
    ]
    spec.required_ruby_version = '>= 1.9'
    spec.add_development_dependency 'rake'
    spec.requirements << 'git'
    spec.license     = 'MIT'
end
