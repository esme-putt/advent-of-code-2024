class Parser 
    def self.parse_file(file_path, separator: nil)
        
        if separator
            values = File.readlines(file_path).map { |line| line.strip.split(separator) }.flatten
        else
            values = File.readlines(file_path).map(&:strip)
        end
        return values
    end

    def self.parse_multi_column_file(file_path)
        
        values = File.readlines(file_path).map do |line| 
            line.split.map(&:to_i)
        end

        return values
    end
end