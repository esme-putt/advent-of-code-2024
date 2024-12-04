require './parser.rb'

# Parse values into lines
lines = Parser.parse_file("4.txt")

matches = 0

# Look for forwards
lines.each do |line|
    matches += line.scan(/XMAS/).length
end

# Look for backwards
lines.each do |line|
    matches += line.scan(/SAMX/).length
end

(0..lines.length - 4).each do |i|
    (0..lines[i].length - 1).each do |j|
        # Look for vertical
        if (lines[i][j] == "X" && lines[i + 1][j] == "M" && lines[i + 2][j] == "A" && lines[i + 3][j] == "S")
            matches += 1
        end

        # Look for upside down
        if (lines[i][j] == "S" && lines[i + 1][j] == "A" && lines[i + 2][j] == "M" && lines[i + 3][j] == "X")
            matches += 1
        end
    end
end

(0..lines.length - 4).each do |i|
    (0..lines[i].length - 4).each do |j|
        # Look for diagonal
        if (lines[i][j] == "X" && lines[i + 1][j + 1] == "M" && lines[i + 2][j + 2] == "A" && lines[i + 3][j + 3] == "S")
            matches += 1
        end

        # Look for reverse diagonal
        if (lines[i][j] == "S" && lines[i + 1][j + 1] == "A" && lines[i + 2][j + 2] == "M" && lines[i + 3][j + 3] == "X")
            matches += 1
        end
    end
end

(0..lines.length - 4).each do |i|
    (lines[i].length - 1).downto(3).each do |j|
        # Look for diagonal flipped
        if (lines[i][j] == "X" && lines[i + 1][j - 1] == "M" && lines[i + 2][j - 2] == "A" && lines[i + 3][j - 3] == "S")
            matches += 1
        end

        # Look for reverse diagonal flipped
        if (lines[i][j] == "S" && lines[i + 1][j - 1] == "A" && lines[i + 2][j - 2] == "M" && lines[i + 3][j - 3] == "X")
            matches += 1
        end
    end
end

puts matches