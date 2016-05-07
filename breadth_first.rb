class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

# Traversal 2, 7, 5, 6, 9, 5, 11, 4
=begin
1. Check if node has the target.
  a. yes - search is over, return the node
  b. no - check if it has children
2. Loop through direct children


=end

# class Queue
#   def initialize
#     @queue = []
#   end

#   def enqueue(item)
#     @queue.push(item)
#   end

#   def dequeue
#     @queue.shift
#   end
# end


# queue = Queue.new

def breadth_first(trunk, target) 
  queue = [trunk]
  loop do
    node = queue.shift
    puts node.payload
    return nil if node == nil
    return node if node.payload == target
    node.children.each { |child| queue << child }
  end
end

breadth_first(trunk, 11).tap { |tree| p tree }



