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

  def test_has_child_node_method
    assert(@tree_node.has_child_node?(@child_node),
           "should accurately reflect whether child_node is child of tree_node")
  end

  def test_parent_reassignment
    @uncle_node = TreeNode.new
    @uncle_node.add_child(@child_node)
    assert(!@tree_node.has_child_node?(@child_node),
           "should remove child_node from tree_node's children when reassigning parent")
  end

end
