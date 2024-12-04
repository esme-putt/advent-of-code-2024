require './parser.rb'

# Parse values into lines
lines = Parser.parse_file("4.txt")

matches = 0

# Look for each scenario
(0..lines.length - 3).each do |i|
    (0..lines[i].length - 3).each do |j|
        if (lines[i][j] == "M" && lines[i][j + 2] == "S" && lines[i + 1][j + 1] == "A" && lines[i + 2][j] == "M" && lines[i + 2][j + 2] == "S")
            matches += 1
        end
        
        if (lines[i][j] == "S" && lines[i][j + 2] == "S" && lines[i + 1][j + 1] == "A" && lines[i + 2][j] == "M" && lines[i + 2][j + 2] == "M")
            matches += 1
        end

        if (lines[i][j] == "S" && lines[i][j + 2] == "M" && lines[i + 1][j + 1] == "A" && lines[i + 2][j] == "S" && lines[i + 2][j + 2] == "M")
            matches += 1
        end

        if (lines[i][j] == "M" && lines[i][j + 2] == "M" && lines[i + 1][j + 1] == "A" && lines[i + 2][j] == "S" && lines[i + 2][j + 2] == "S")
            matches += 1
        end
    end
end

puts matches