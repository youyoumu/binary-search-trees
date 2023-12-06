require "./lib/node.rb"
require "./lib/tree.rb"

# array = Array.new(25) { rand(1..99) }
# array = array.uniq
# array = array.sort
# p array
array = [3, 5, 7, 12, 14, 21, 31, 35, 40, 42, 46, 53, 55, 56, 57, 58, 62, 70, 76, 86, 96, 99]
p array


bst = Tree.new(array)
bst.pretty_print
puts "inserting 98"
bst.insert(98)
bst.pretty_print
puts "deleting 98"
bst.delete(98)
bst.pretty_print
puts "deleting 98"
bst.delete(98)
puts "deleting 40"
bst.delete(40)
bst.pretty_print
puts "deleting 62"
bst.delete(62)
bst.pretty_print
