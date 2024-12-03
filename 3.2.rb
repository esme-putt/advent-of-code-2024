require './parser.rb'

# Parse file
values = File.read("3.txt")

# Split into 'dos' and 'don'ts
lines = values.split(/(?=do|don't)/)


all_matches = []
# Find all of the strings that match
lines.each do |line|

    # Only includes matches from the lines that don't begin with a 'don't
    if !line.include?("don't")
        matches = line.scan(/mul\(\d{1,3},\d{1,3}\)/)
        all_matches.push(matches)
    end
end

sum = 0
all_matches.flatten.each do |match|
    # Separate out the numbers
    numbers = match.scan(/\d{1,3}/)
    
    if numbers.length == 2
        product = numbers[0].to_i * numbers[1].to_i
        sum += product
    end
end

puts sum