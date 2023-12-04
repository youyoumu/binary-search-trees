class Node
include Comparable

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other_data)
    @data <=> other_data
  end
end
