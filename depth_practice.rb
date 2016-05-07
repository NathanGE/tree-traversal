class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end


# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree, each hold an array (children)
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree, holds an array (children)
trunk   = Tree.new(2, [seventh_node, fifth_node])

# Traversal 2, 7, 6, 5, then 11
=begin
I. Check the if node.payload matches the value of the argument entered.
  A. If it does, return it.
  B. If it doesn't, check if the node has any children.
    1. If it doesn't have children, search is done, returning a nil value
    2. If it does have children, loop through each of the children, perform step #1 on the child and check it’s value.  If it’s value is nil, it hasn’t been found inside that child.  So we need to look at other children.  But, if we find we find it (it returns a non-nil value), we should return the value itself.)
=end

# def depth_first(node, target)
#   puts node.payload
#   if node.payload == target
#     return node
#   else
#     node.children.each do |child|
#       found = depth_first(child, target)
#       if found == target
        
#       else
        
#       end
#     end
#   end
# end

def depth_first(trunk, target)
  stack = [trunk]
  loop do
    node = stack.pop
    puts node.payload
    return nil if node == nil
    return node if node.payload == target
    node.children.reverse_each { |child| stack << child }
  end
end

depth_first(trunk, 11).tap { |tree| p tree }
# depth_first(trunk, 11)

