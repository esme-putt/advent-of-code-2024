require './parser.rb'

# Parse values into lines
reports = Parser.parse_multi_column_file("2.txt")

safe_reports = 0
reports.map do |report|
    # Define the ruleset
    increasing = false
    decreasing = false
    adjacent_levels_safe = true
    safe = true

    previous_value = report[0]
    (1..report.length - 1).each do |i|
        value = report[i]

        if value > previous_value 
            increasing = true
        end

        if value < previous_value
            decreasing = true
        end

        if 1 > ((value - previous_value).abs) || ((value - previous_value).abs)  > 3
            adjacent_levels_safe = false
        end

        previous_value = value
    end

    if adjacent_levels_safe == true && ((increasing && !decreasing) || (!increasing && decreasing))
        safe_reports += 1
    end
end

puts safe_reports
