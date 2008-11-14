# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/bludgeon.rb'

Hoe.new('bludgeon', Bludgeon::VERSION) do |p|
  p.developer('Phil Hagelberg', 'technomancy@gmail.com')
  p.extra_dev_deps << ['minitest', '>= 1.3.0']
end

desc "Prepare to upload to the git hubs."
task :github do
  system "git ls-files > Manifest.txt"
  system "rake debug_gem | egrep -v \"^\\(in\" > bludgeon.gemspec"
end

task :gem => :github

# vim: syntax=Ruby
