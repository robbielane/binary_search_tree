require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bst'

class NodeTest < Minitest::Test
  def test_it_stores_data
    assert_equal 'data1', Node.new('data1').data
  end

  def test_it_stores_left_data
    assert_equal 'data2', Node.new('data1', Node.new('data2')).left.data
  end

  def test_it_stores_right_data
    assert_equal 'data3', Node.new('data1', Node.new('data2'), Node.new('data3')).right.data

  end
end
