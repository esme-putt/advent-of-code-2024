require './parser.rb'

# Parse values into lines
lines = Parser.parse_file("../datasets/5.txt")

hash = Hash.new
sum = 0

lines.each do |line|
    if line.include?("|")
        numbers = line.split("|").map { |num| num.to_i }
        hash[numbers[0]] = hash.fetch(numbers[0], [])

        # Create a hash of the ruleset
        if numbers.length == 2
            hash[numbers[0]].push(numbers[1])
        end
    end

    if line.include?(",")
        modified = false
        changeMade = true
        numbers = line.split(",").map { |num| num.to_i }

        while changeMade
            changeMade = false
            (0..numbers.length - 1).each do |i|
                # If the rule contains this number as a value, we must ensure nothing
                # stored as a key comes AFTER the number
                keys = hash.select { |key, value| value.include?(numbers[i]) }.keys
                
                ((i + 1)..numbers.length - 1).each do |j|
                    if keys.include?(numbers[j])
                        placeholder = numbers[i]
                        numbers[i] = numbers[j]
                        numbers[j] = placeholder
                        changeMade = true
                        
                        modified = true
                    end
                end

                break if changeMade
            end
        end

        if modified
            sum += numbers[numbers.length/2.to_i]
        end
    end
end

puts sum