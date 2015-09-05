require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/bst'

class BstTest < Minitest::Test
  def test_returns_nil_when_head_empty
    assert_nil Bst.new.head
  end

  def test_insert_adds_data_to_head
    tree = Bst.new
    tree.insert(1)

    assert_equal 1, tree.head.data
  end

  def test_less_than_goes_left
    tree = Bst.new
    tree.insert(2)
    tree.insert(1)

    assert_equal 1, tree.head.left.data
 end

  def test_equal_data_goes_left
    tree = Bst.new
    tree.insert(1)
    tree.insert(1)

    assert_equal 1, tree.head.left.data
  end

  def test_greater_than_goes_right
    tree = Bst.new
    tree.insert(2)
    tree.insert(3)

    assert_equal 3, tree.head.right.data
  end

  def test_less_than_continues_to_go_left
    tree = Bst.new
    tree.insert(5)
    tree.insert(4)
    tree.insert(3)
    tree.insert(2)
    tree.insert(1)

    assert_equal 1, tree.head.left.left.left.left.data
 end

 def test_less_than_continues_to_go_right
   tree = Bst.new
   tree.insert(1)
   tree.insert(2)
   tree.insert(3)
   tree.insert(4)
   tree.insert(5)

   assert_equal 5, tree.head.right.right.right.right.data
 end

 def test_include_verifys_a_value
   tree = Bst.new
   tree.insert(6)
   tree.insert(5)
   tree.insert(7)
   tree.insert(4)
   tree.insert(8)
   tree.insert(3)
   tree.insert(9)

   assert tree.include?(8)
 end

 def test_include_rejects_a_value
   tree = Bst.new
   tree.insert(6)
   tree.insert(5)
   tree.insert(7)
   tree.insert(4)
   tree.insert(8)
   tree.insert(3)
   tree.insert(9)

   refute tree.include?(10)
 end
end