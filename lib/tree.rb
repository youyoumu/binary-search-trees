class Tree
attr_accessor :array, :root

  def initialize(array)
    @array = array
    @root = build_tree(array, 0, array.length-1)
  end

  def build_tree(array, min, max)
    return nil if min > max
    mid = (min + max) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array, min, mid-1)
    root.right = build_tree(array, mid+1, max)
    return root
  end

  def insert(data)
    new_node = Node.new(data)
    insert_recursive(new_node, @root)
  end

  def insert_recursive(new_node, node)
    if new_node > node
      if node.right.nil?
        node.right = new_node
      else
        insert_recursive(new_node, node.right)
      end
    else
      if node.left.nil?
        node.left = new_node
      else
        insert_recursive(new_node, node.left)
      end
    end
  end

  # Copied
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
