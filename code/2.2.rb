require './parser.rb'

class Exercise 

    def calculate 
         # Parse values into lines
        reports = Parser.parse_multi_column_file("2.txt")

        safe_reports = 0
        reports.map do |report|
            safe_version = false

            # Try with the regular report
            if test_report(report)
                safe_version = true
            end

            length = report.length
            if !safe_version
                # Create new versions of the reports with one missing value
                (0..length - 1).each do |i|
                    new_report = report.dup
                    new_report.delete_at(i)

                    if test_report(new_report)
                        safe_version = true
                    end
                end
            end

            if safe_version
                safe_reports += 1
            end
        end
        puts safe_reports
    end

    def test_report(report)
        # Define the ruleset
        increasing = false
        decreasing = false
        adjacent_levels_safe = true
    
        previous_value = report[0]
        length = report.length
        (1..length - 1).each do |i|
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
            return true
        end
            
        return false
    end
end

Exercise.new.calculate