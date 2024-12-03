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

# For each value in list 1, check how many times it occurs in list 2
length = list1.length
answer = 0
(0..length - 1).each do |i|
    value = list1[i]

    occurances = 0
    (0..length - 1).each do |i|
        if list2[i] == value
            occurances += 1
        end
    end

    answer += value * occurances
end

puts answer