class TreeNode
  attr :children
  attr_reader :parent
  attr_accessor :name

  def initialize(name=nil)
    @name = name
    @children = []
  end

  def add_child(child)
    child.parent = self if @children << child
  end

  def children_count
    @children.size
  end

  def parent=(new_parent)
    @parent = new_parent
  end
  
  def is_child_node?(node)
    @children.include? node
  end

end
