require "./lib/node.rb"
require "./lib/tree.rb"

array = Array.new(15) { rand(1..99) }
array = array.uniq
array = array.sort
p array

bst = Tree.new(array)
bst.pretty_print
puts "inserting 98"
bst.insert(98)
bst.pretty_print
