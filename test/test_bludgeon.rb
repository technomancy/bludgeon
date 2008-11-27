require 'rubygems'
require 'minitest/unit'
require File.dirname(__FILE__) + '/../lib/bludgeon'

class TestBludgeon < MiniTest::Unit::TestCase
  def test_bludgeon_bus_scheme
    output = `#{File.dirname(__FILE__)}/../bin/bludgeon "Bus Scheme" \
git://github.com/technomancy/bus-scheme.git`
    assert_match /could not bludgeon someone to death/, output
  end

  def test_bludgeon_rspec
    output = `#{File.dirname(__FILE__)}/../bin/bludgeon rspec \
git://github.com/dchelimsky/rspec.git`
    assert_match /could bludgeon someone to death/, output
  end

  def test_initialize
    p = Bludgeon::Project.new 'http://github.com/technomancy/bus-scheme.git'
    assert_equal :git, p.type
    assert_equal 'bus-scheme', p.extract_name(p.url)
    assert_equal 'bus-scheme', p.name
  end
end

MiniTest::Unit.autorun
