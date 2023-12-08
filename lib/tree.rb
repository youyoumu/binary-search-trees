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

  def delete(data)
    delete_recursive(data, @root)
  end

  def delete_recursive(data, node)
    if node.nil?
      puts "data #{data} is not found"
      return
    end
    if node.data == data
      if node.left.nil? && node.right.nil?
        delete_leaf(node, @root)
      elsif node.left.nil? && !node.right.nil?
          delete_one_child(node, node.right, @root)
      elsif !node.left.nil? && node.right.nil?
        delete_one_child(node, node.left, @root)
      else
        delete_two_child(node, node.left, node.right)
      end
    elsif data > node.data
      delete_recursive(data, node.right)
    else
      delete_recursive(data, node.left)
    end

  end

  def delete_leaf(data, node)
    if node.left == data
      node.left = nil
    elsif node.right == data
      node.right = nil
    elsif data > node
      delete_leaf(data, node.right)
    else
      delete_leaf(data, node.left)
    end
  end

  def delete_one_child(data, child_node, node)
    if node.left == data
      node.left = child_node
    elsif node.right == data
      node.right = child_node
    elsif data > node
      delete_one_child(data, child_node, node.right)
    else
      delete_one_child(data, child_node, node.left)
    end
  end

  def delete_two_child(data, left, right)
    right_lowest = delete_find_lowest(right)
    delete_one_child(data, right_lowest, @root)
    right_lowest.left = left
    right_lowest.right = right
  end

  def delete_find_lowest(node)
    if node.left.nil?
      if !node.right.nil?
        delete_one_child(node, node.right, @root)
      end
      return node
    end
    delete_find_lowest(node.left)
  end

  def find(data)
    find_recursive(data, @root)
  end

  def find_recursive(data, node)
    if node.nil?
      puts "data #{data} is not found"
      return
    end
    if node.data == data
      return node
    elsif data > node.data
      find_recursive(data, node.right)
    else
      find_recursive(data, node.left)
    end
  end

  def level_order(&block)
    queue = [@root]
    array = []
    array = level_order_recursive(queue, @root, array, &block)
    return array unless block_given?
    return
  end

  def level_order_recursive(queue, node, array, &block)
    queue = queue.compact
    if queue.empty?
      return array
    end
    yield(node.data) if block_given?
    array.push(node.data)
    queue.shift
    queue.push(node.left)
    queue.push(node.right)
    level_order_recursive(queue, queue[0], array, &block)
  end

  def preorder(&block)
    array = []
    array = preorder_recursive(@root, array, &block)
    return array unless block_given?
    return
  end

  def preorder_recursive(node, array, &block)
    return array if node.nil?
    if block_given?
      yield node.data
    else
      array.push(node.data)
    end
    array = preorder_recursive(node.left, array, &block)
    preorder_recursive(node.right, array, &block)
  end

  def inorder(&block)
    array = []
    array = inorder_recursive(@root, array, &block)
    return array unless block_given?
    return
  end

  def inorder_recursive(node, array, &block)
    return array if node.nil?
    array = inorder_recursive(node.left, array, &block)
    if block_given?
      yield node.data
    else
      array.push(node.data)
    end
    inorder_recursive(node.right, array, &block)
  end

  def postorder(&block)
    array = []
    array = postorder_recursive(@root, array, &block)
    return array unless block_given?
    return
  end

  def postorder_recursive(node, array, &block)
    return array if node.nil?
    array = postorder_recursive(node.left, array, &block)
    array = postorder_recursive(node.right, array, &block)
    if block_given?
      yield node.data
    else
      array.push(node.data)
    end
  end

  def height(node)
    counter = 0
    return height_recursive(node, counter)
  end

  def height_recursive(node, counter)
    if node.nil?
      return counter
    end
    counter += 1
    a = height_recursive(node.left, counter)
    b = height_recursive(node.right, counter)
    if a > b
      return a
    else
      return b
    end
  end

  def depth(node)
    counter = 0
    return depth_recursive(node, @root, counter)
  end

  def depth_recursive(node, root, counter)
    if node.nil?
      puts "node doesn't exist"
      return
    end
    if node == root
      return counter
    elsif node > root
      depth_recursive(node, root.right, counter+1)
    else
      depth_recursive(node, root.left, counter+1)
    end
  end

  def balanced?(root = @root)
    return true if root.nil?
    a, b = 0, 0
    a = height(root.right) unless root.right.nil?
    b = height(root.left) unless root.left.nil?
    return false if a - b > 1 || b - a > 1
    a = balanced?(root.right)
    b = balanced?(root.left)
    return true if a == true && b == true
    return false
  end

  # Copied
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
