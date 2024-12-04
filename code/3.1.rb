require './parser.rb'

# Parse file
values = File.read("3.txt")

# Find all of the strings that match
matches = values.scan(/mul\(\d{1,3},\d{1,3}\)/)

sum = 0
matches.each do |match|
    # Separate out the numbers
    numbers = match.scan(/\d{1,3}/)
    
    if numbers.length == 2
        product = numbers[0].to_i * numbers[1].to_i
        sum += product
    end
end

puts sum