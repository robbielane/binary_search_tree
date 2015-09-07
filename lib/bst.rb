require 'pry'
require_relative 'node'

class Bst
  attr_reader :head

  def initialize(head=nil)
    @head = head
  end

  def insert(data)
    node = Node.new(data)
    if !head
      @head = node
    else
      cursor = traverse(data)
      if node.data <= cursor.data
        cursor.left = node
      else
        cursor.right = node
      end
    end
  end

  def traverse(data, cursor=@head)
    return cursor if cursor.data == data
    if data <= cursor.data && !cursor.left.nil?
      cursor = cursor.left
      cursor = traverse(data, cursor)
    elsif data > cursor.data && !cursor.right.nil?
      cursor = cursor.right
      cursor = traverse(data, cursor)
    end
    return cursor
  end

  def minimum(cursor=@head)
    return if !head
    until cursor.left.nil? do
      cursor = cursor.left
    end
    cursor.data
  end

  def maximum(cursor=@head)
    return if !head
    until cursor.right.nil? do
      cursor = cursor.right
    end
    cursor.data
  end

  def include?(data)
    return true if data == @head.data
    cursor = find_traverse(data)
    return false if cursor == nil
    data == cursor.data ? true : false
  end

  def find_traverse(data, cursor=@head)
    while !cursor.nil?
      if data == cursor.data
        return cursor
      elsif data < cursor.data
        cursor = cursor.left
      else
        cursor = cursor.right
      end
    end
  end

  # def find_traverse(data, cursor=@head)
  #   if data < cursor.data && !cursor.left.nil?
  #     cursor = cursor.left
  #     cursor = traverse(data, cursor) if data < cursor.data && !cursor.left.nil?
  #   elsif data > cursor.data && !cursor.right.nil?
  #     cursor = cursor.right
  #     cursor = traverse(data, cursor) if data > cursor.data && !cursor.right.nil?
  #   end
  #   return cursor
  # end

  # def find_traverse(data, cursor=@head)
  #   if !cursor.left.nil?
  #     cursor = find_traverse(data, cursor.left)
  #     return cursor if cursor.data == data
  #   elsif !cursor.right.nil?
  #     cursor = find_traverse(data, cursor.right)
  #     return cursor if cursor.data == data
  #   end
  # end

  def depth_of(data)
    depth = 0
    return nil if !head
    if data == @head.data
      depth += 1
    else
      depth = find_depth_traverse(data)
    end
    depth
  end

  def find_depth_traverse(data, depth=1, cursor=@head)
    if data < cursor.data && !cursor.left.nil?
      cursor = cursor.left
      depth += 1
      cursor = find_depth_traverse(data, depth, cursor) if cursor.data != data
    elsif data > cursor.data && !cursor.right.nil?
      cursor = cursor.right
      depth += 1
      cursor = find_depth_traverse(data, depth, cursor) if cursor.data != data
      end
    depth
  end

  def sort
    sorted = []
    sort_traverse(sorted)
    sorted
  end

  def sort_traverse(sorted, cursor=@head)
    return if !cursor
    sort_traverse(sorted, cursor.left)
    sorted << cursor.data
    sort_traverse(sorted, cursor.right)
    sorted
  end
end

# tree = Bst.new
# File.open('input.txt').readlines.each do |line|
#   tree.insert(line.chomp.to_i)
# end
# p tree
#
# tree.traverse_all
