# leetcode link: https://leetcode.com/problems/merge-sorted-array/submissions/1102924114/
def partitioned(array, left, right, pivot)
  while left <= right
      while array[left] < pivot
          left+=1
      end
      while array[right] > pivot
          right -= 1
      end
      if left <= right
          array[left], array[right] = array[right], array[left]
          left+=1
          right -= 1
      end 
  end
  return left
end

def sort_list(array, s, e)
  if s < e
      middle = (s + e) / 2
      pivot = array[middle]
      index = partitioned(array, s, e, pivot)
      sort_list(array, s, (index - 1))
      sort_list(array, index, e)
  end
end

def merge(nums1, m, nums2, n)

  return nums1 if n == 0

  i = m
  j = 0
  size = (m + n)

  while i < size
    nums1[i] = nums2[j]
    j += 1 if j <= (n - 1)
    i += 1
  end

  sort_list(nums1, 0, (size - 1))
  nums1
end

p merge([-1,0,0,3,3,3,0,0,0], 6, [1,2,2], 3)