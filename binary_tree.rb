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
      node.left.nil?  ? node.left  = Node.new(val,node) : insert(val,node.left)
    else
      node.right.nil? ? node.right = Node.new(val,node) : insert(val,node.right)
    end
  end

  def self.breadth_first_search(val,head)
    queue = [head]
    until queue.empty?
      place = queue.shift
      return place          if place == val
      queue << place.left   if place.left
      queue << place.right  if place.right
    end
  end

  def self.depth_first_search(val,head)
    stack = [head]
    until stack.empty?
      place = stack.pop
      return place          if place == val
      stack << place.left   if place.left
      stack << place.right  if place.right
    end
  end

  def self.dfs_rec(val,head)
    if val == head.value
      return head
    else
      dfs_rec(val,head.left)  if head.left
      dfs_rec(val,head.right) if head.right
    end
  end
end
