# merge and sort two arrays without using [*left, *right].sort
def merge_array(left, right)
  merged_array = []
  i = 0

  loop do
    left_num = left.first
    right_num = right.first
    # puts "left: #{left_num} right: #{right_num}"
    break if left_num.nil? && right_num.nil?
    left_i = i - 2
    right_i = i - 1
    merged_l = merged_array[left_i]
    merged_r = merged_array.last
    # puts "merged_l: #{merged_l} merged_r: #{merged_r}"
    # puts "index: #{i}"

    if left_num && left_num < right_num
      if i >= 2 && merged_l < left_num && merged_r > left_num
        merged_array.insert(left_i, left_num)
      else
        merged_array << left_num
      end
      left.shift
    else
      if i > 1 && merged_l < right_num && merged_r > right_num
        # puts 'here'
        merged_array.insert(right_i, right_num)
      else
        merged_array << right_num
      end
      right.shift
    end
    # puts
    # puts merged_array.inspect
    # puts
    i += 1
  end
  merged_array
end

puts merge_array([1, 2, 5], [3, 4, 6]).inspect
puts
puts merge_array([1, 4, 5], [3, 2, 6]).inspect

