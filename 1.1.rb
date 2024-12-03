require './parser.rb'

# Parse values into lines
values = Parser.parse_multi_column_file("1.txt")

# Separate values into two lists
list1 = []
list2 = []
values.map { |value|
    list1.push(value[0])
    list2.push(value[1])
}

# Put lists in numerical order
sortedList1 = list1.sort
sortedList2 = list2.sort

# Calculate distance between list values and add to answer
length = list1.length
answer = 0
(0..length - 1).each do |i|
    answer += (sortedList1[i] - sortedList2[i]).abs
end

puts answer
