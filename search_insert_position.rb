# leetcode: https://leetcode.com/problems/search-insert-position/submissions/1102382441/
def binary_search(left_index, right_index, array, target)
  middle = (right_index + left_index) / 2

  if target == array[middle]
      return middle
  end

  if (middle == left_index) && (target < array[middle])
    return middle
  end

  if (right_index - left_index) == 0
    return (middle + 1) if target > array[middle]
    return middle
  end

  if target > array[middle]
      binary_search((middle + 1), right_index, array, target)
  else
      binary_search(left_index, (middle - 1), array, target)
  end
end

def search_insert(nums, target)
  return -1 if nums.length == 0
  return 0 if nums.length == 1 && nums[0] == target
  binary_search(0, (nums.length - 1), nums, target)
end

p search_insert([1,3,5,6], 4)
# p search_insert([1,3,5,6], 5)