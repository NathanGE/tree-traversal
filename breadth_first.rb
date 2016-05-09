# breadth first search
class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

def breadth_first(node, target) 
  queue = [node]
  until queue.empty?
    current = queue.shift
    return current if current.payload == target
    current.children.each { |child| queue << child }
  end
end
