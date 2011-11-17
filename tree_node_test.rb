require 'test/unit'
require './tree_node.rb'

class TreeNodeTest < Test::Unit::TestCase

  def setup
    @tree_node = TreeNode.new
  end

  def test_has_no_children_when_created
    assert_equal(0, @tree_node.children_count,
                 "should have an empty children array when created")
  end

  def test_has_no_parent_when_created
    assert_nil(@tree_node.parent)
  end

  def test_name_setter_method
    assert_nothing_raised NoMethodError do
      @tree_node.name = "Test Tree"
    end
  end

  def test_name_getter_method
    @tree_node.name = "Test"
    assert_equal("Test", @tree_node.name,
                 "should have implemented name= method")
  end

end

class TreeNodeChildAssignmentTest < Test::Unit::TestCase

  def setup
    @tree_node = TreeNode.new
    @child_node = TreeNode.new
    @tree_node.add_child(@child_node)
  end

  def test_children_count
    assert_equal(1, @tree_node.children_count,
                 "should have a single child when one is added")
  end

  def test_parent_assignment
    assert_equal(@tree_node, @child_node.parent,
                 "should have a parent when added as a child")
  end

  def test_has_child_method
    assert(@tree_node.has_child?(@child_node),
           "should accurately reflect whether child_node is child of tree_node")
  end

  def test_parent_reassignment
    @uncle_node = TreeNode.new
    @uncle_node.add_child(@child_node)
    assert(!@tree_node.has_child?(@child_node),
           "should remove child_node from tree_node's children when reassigning parent")
  end

end

class TreeNodePathTest < Test::Unit::TestCase

  def setup
    @grandchild_node = TreeNode.new("Grandchild")
    @child_node = TreeNode.new("Child")
    @parent_node = TreeNode.new("Parent")

    @parent_node.add_child(@child_node)
    @child_node.add_child(@grandchild_node)
  end

  def test_path_to_node_method
    assert_equal("Parent>Child>Grandchild", @grandchild_node.path_to_node,
                 "should display full path from tree root to node")
  end

end

class TreeNodeTraversalTest < Test::Unit::TestCase

  def setup
    @a_node = TreeNode.new("A")
    @b_node = TreeNode.new("B")
    @c_node = TreeNode.new("C")
    @d_node = TreeNode.new("D")
    @e_node = TreeNode.new("E")
    @f_node = TreeNode.new("F")
    @g_node = TreeNode.new("G")

    @a_node.add_child(@b_node)
    @a_node.add_child(@c_node)

    @b_node.add_child(@d_node)
    @b_node.add_child(@e_node)

    @e_node.add_child(@f_node)
    @e_node.add_child(@g_node)
  end

  def test_preorder_traversal
    expected_traversal = ["A", "B", "D", "E", "F", "G", "C"]

    @a_node.preorder_traversal do |node|
      assert_equal(expected_traversal.shift, node.name)
    end
  end

end
