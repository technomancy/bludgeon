# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bludgeon}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Hagelberg"]
  s.date = %q{2008-11-14}
  s.default_executable = %q{bludgeon}
  s.description = %q{In #merb on Freenode:  11:54 <technomancy> I'm sticking with minitest because rspec nests instance_evals three-deep, but if that doesn't scare you away, go for it. =) 11:56 <scottmotte>  i don't know enough for it to scare me yet =) 11:56 <jackdempsey> hehe 11:57 <technomancy> I'm just saying ... if you could take the printout of a library and bludgeon someone to death with it, it might be time to look for a lighter alternative.}
  s.email = ["technomancy@gmail.com"]
  s.executables = ["bludgeon"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/bludgeon", "bludgeon.gemspec", "lib/bludgeon.rb", "test/test_bludgeon.rb"]
  s.has_rdoc = true
  s.homepage = %q{Bludgeon is a tool which will tell you if a given library is so large}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bludgeon}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{In #merb on Freenode:  11:54 <technomancy> I'm sticking with minitest because rspec nests instance_evals three-deep, but if that doesn't scare you away, go for it}
  s.test_files = ["test/test_bludgeon.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<minitest>, [">= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
