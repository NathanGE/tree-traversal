class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

def depth_first(node, target)
  return node if node.payload == target
  node.children.each do |child|
    found = depth_first(child, target)
    return found if found
  end
  nil
end
