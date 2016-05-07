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
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

# Traversal 2, 7, 6, 5, then 11
# Need to check: does child have answer,
# yes? return it,
# no? does child have ans,
# nil? go back up
def depth_first(tree, target)
  puts tree.payload
  if tree.payload == target
    return tree
  elsif tree.children != []
    tree.children.each do |child|
      if child.payload
          p 'before'
          p answer = depth_first(child, target)
          p 'after'
      else
        tree
      end
    end
  end
end

# def depth_first(tree, target)
#   current ||= tree
#   puts current.payload
#   if current.payload == target
#     return current.payload
#   else
#     tree.children.each do |child|
#       current = child
#       if current.payload
#         depth_first(current, target)
#       end
#     end
#   end
# end

def depth_first(node, target)
  puts node.payload
  return node if node.payload == target
  node.children.each do |child|
    found = depth_first(child, target)
    return found if found
  end
  nil
end

depth_first(trunk, 11).tap { |tree| p tree }


