class TreeNode
  attr :children
  attr_reader :parent
  attr_accessor :name

  def initialize(name=nil)
    @name = name
    @children = []
  end

  def add_child(child)
    child.parent = self
    @children << child
  end

  def children_count
    @children.size
  end

  def parent=(new_parent)
    @parent.children.delete(self) if @parent
    @parent = new_parent
  end
  
  def has_child?(node)
    @children.include? node
  end

  def path_to_node
    path = ""
    path = "#{parent.path_to_node} > " if parent
    path += @name
  end

  def preorder_traversal(&block)
    block.call(self)
    self.children.each do |child|
      child.preorder_traversal(&block)
    end
  end

end
