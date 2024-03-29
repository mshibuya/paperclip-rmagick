# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "paperclip-rmagick"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["M.Shibuya"]
  s.date = "2011-12-01"
  s.description = "Paperclip processor using RMagick for image manipulation. Requires Paperclip and RMagick installed."
  s.email = "mit.shibuya@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/paperclip-rmagick.rb",
    "lib/paperclip/rmagick.rb",
    "paperclip-rmagick.gemspec",
    "spec/paperclip-rmagick_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/base.png",
    "spec/support/frame.png",
    "spec/support/interpolations.rb",
    "spec/support/models.rb",
    "spec/support/monster.png"
  ]
  s.homepage = "http://github.com/mshibuya/paperclip-rmagick"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Paperclip processor using RMagick for image manipulation"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, ["~> 2.4"])
      s.add_runtime_dependency(%q<rmagick>, ["~> 2.13"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
    else
      s.add_dependency(%q<paperclip>, ["~> 2.4"])
      s.add_dependency(%q<rmagick>, ["~> 2.13"])
      s.add_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
    end
  else
    s.add_dependency(%q<paperclip>, ["~> 2.4"])
    s.add_dependency(%q<rmagick>, ["~> 2.13"])
    s.add_dependency(%q<rspec>, ["~> 2.7.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
  end
end

