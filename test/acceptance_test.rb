require_relative 'test_helper'

class AcceptanceTest < MiniTest::Unit::TestCase
  class Person
    include Lift

    attr_accessor :nick
  end

  module Gender
    def initialize
      @gender = :male
    end

    def gender
      @gender
    end
  end

  def test_sets_attributes
    person = Person.new nick: 'ahawkins'
    assert_equal 'ahawkins', person.nick
  end

  def test_works_with_a_block
    person = Person.new do |person|
      person.nick = 'ahawkins'
    end

    assert_equal 'ahawkins', person.nick
  end

  def test_super_is_called
    klass = Class.new do
      include Gender
      include Lift
    end

    person = klass.new

    assert_equal :male, person.gender
  end
end
