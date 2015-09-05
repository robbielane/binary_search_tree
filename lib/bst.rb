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
    if data <= cursor.data && !cursor.left.nil?
      cursor = cursor.left
      traverse(data, cursor)
    elsif data > cursor.data && !cursor.right.nil?
      cursor = cursor.right
      traverse(data, cursor)
    end
    return cursor
  end
end
