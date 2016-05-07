require 'minitest/autorun'
require_relative 'depth_first2'

class DepthFirstTest < MiniTest::Unit::TestCase
  def test_depth_first
    # Leaves
    deep_fifth_node = Tree.new(5, [])
    eleventh_node = Tree.new(11, [])
    fourth_node = Tree.new(4, [])
    # Branches
    ninth_node = Tree.new(9, [fourth_node])
    sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
    seventh_node = Tree.new(7, [sixth_node])
    shallow_fifth_node = Tree.new(5, [ninth_node])
    # Trunk
    trunk = Tree.new(2, [seventh_node, shallow_fifth_node])
    assert_equal eleventh_node, depth_first(trunk, 11)
  end
end