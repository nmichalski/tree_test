class TreeNode
  attr :children
  attr_reader :parent
  attr_accessor :name

  def initialize(name=nil)
    @name = name
    @children = []
  end

  def remove_child_from_parent(child)
    if child.parent
      child.parent.children.delete(child)
    end
  end

  def add_child(child)
    # TODO: refactor pseudo-atomic calls
    child.parent = nil if remove_child_from_parent(child)
    child.parent = self if @children << child
  end

  def children_count
    @children.size
  end

  def parent=(new_parent)
    @parent = new_parent
  end
  
  def has_child_node?(node)
    @children.include? node
  end

  def path_to_node
    path = ""
    if parent
      path = "#{parent.path_to_node}>"
    end

    path += @name
  end

end
