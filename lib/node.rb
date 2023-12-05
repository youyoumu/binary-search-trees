class Node
include Comparable
attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other_data)
    data <=> other_data.data
  end
end
