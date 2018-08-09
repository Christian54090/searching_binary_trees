class Node
  attr_accessor :value, :left, :right

  def initialize(value,parent=nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end

  def self.build_tree(arr)
    head = Node.new(arr[0])
    arr[1..-1].each{ |val| insert(val,head) }
  end

  def self.insert(val=nil,node)
    if val < node.value
      node.left.nil? ? node.left = Node.new(val,node) : insert(val,node.left)
    else
      node.right.nil? ? node.right = Node.new(val,node) : insert(val,node.right)
    end
  end
end
