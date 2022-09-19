# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        span = self.max - self.min
        span
     end

    def average
        return nil if self.length == 0
        return self.sum * 1.0 / self.length
    end

    def median
        return nil if self.length == 0
        if self.length % 2 != 0 
            return self.sort[self.length / 2]
        else
            return [self.sort[self.length / 2], self.sort[self.length / 2 - 1]].average
        end
    end

    def counts
        counts = Hash.new(0)
        self.each { |num| counts[num] += 1 }
        counts
    end

    def my_count(num)
        count = 0
        self.each { |ele| count += 1 if ele == num }
        count
    end

    def my_index(num)
        return nil if !self.include?(num)

        self.each_with_index { |ele, i| return i if ele == num }
    end

    def my_uniq
        uniq_arr = []
        self.each { |ele| uniq_arr << ele if !uniq_arr.include?(ele) }
        uniq_arr
    end

    def my_transpose
        height = self.length
        width = self[0].length
        transposed = Array.new(height) {Array.new(width)}

        self.each_with_index do |subarray, i1|
            subarray.each_with_index do |ele, i2|
                transposed[i1][i2] = self[i2][i1]
            end
        end
        transposed
    end

end

