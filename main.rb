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

# #insert test
# puts "inserting 98"
# bst.insert(98)
# bst.pretty_print

# #delete test
# puts "deleting 98"
# bst.delete(98)
# bst.pretty_print
# puts "deleting 98"
# bst.delete(98)
# puts "deleting 40"
# bst.delete(40)
# bst.pretty_print
# puts "deleting 62"
# bst.delete(62)
# bst.pretty_print

# #find test
# puts bst.find(99)

# #level_order test
# bst.level_order do |a|
#   puts a*2
# end
# test = bst.level_order
# p test

# #preorder test
# bst.preorder do |a|
#     puts a*2
# end
# test = bst.preorder
# p test

# #inorder test
# bst.inorder do |a|
#   puts a*2
# end
# test = bst.inorder
# p test

# #postorder test
# bst.postorder do |a|
#   puts a*2
# end
# test = bst.postorder
# p test

# #height test
# test = bst.find(62)
# test2 = bst.find(14)
# puts bst.height(test)
# puts bst.height(test2)
# bst.insert(100)
# bst.insert(105)
# bst.insert(107)
# bst.pretty_print
# puts bst.height(test)
# puts bst.height(test2)

# #depth test
# test = bst.find(42)
# test2 = bst.find(62)
# puts bst.depth(test)
# puts bst.depth(test2)

# #balanced? test
# puts bst.balanced?
# bst.insert(95)
# bst.insert(1)
# bst.insert(4)
# bst.insert(6)
# bst.pretty_print
# puts bst.balanced?
# bst.insert(100)
# bst.pretty_print
# puts bst.balanced?
# bst.insert(98)
# bst.insert(101)
# bst.pretty_print
# puts bst.balanced?

# #rebalance test
bst.rebalance
bst.insert(100)
bst.insert(101)
bst.insert(102)
bst.insert(103)
bst.insert(104)
bst.insert(106)
bst.insert(107)
bst.pretty_print
bst.rebalance
bst.pretty_print
