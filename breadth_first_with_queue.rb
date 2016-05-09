# breadth-first search with a queue data structure
class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue << item
  end

  def dequeue
    @queue.shift
  end

  def empty?
    @queue.empty?
  end
end

def breadth_first(node, target)
  queue = Queue.new
  queue.enqueue(node)
  until queue.empty?
    current = queue.dequeue
    return current if current.payload == target
    if current.children
      current.children.each{ |child| queue.enqueue(child) }
    end
  end
end
