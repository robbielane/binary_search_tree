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

  def include?(data)
    return true if data == @head.data
    cursor = find_traverse(data)
    data == cursor.data ? true : false
  end

  def depth_of(data)
    depth = 0
    return nil if !head
    if data == @head.data
      depth += 1
    else
      #do this
    end
    depth
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

  def find_traverse(data, cursor=@head)
    if data < cursor.data && !cursor.left.nil?
      cursor = cursor.left
      cursor = traverse(data, cursor) if data < cursor.data && !cursor.left.nil?
    elsif data > cursor.data && !cursor.right.nil?
      cursor = cursor.right
      cursor = traverse(data, cursor) if data > cursor.data && !cursor.right.nil?
    end
    return cursor
  end
end
