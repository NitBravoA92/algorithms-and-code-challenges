# leetcode link: https://leetcode.com/problems/valid-palindrome/submissions/1104353076/
def is_palindrome(s)
  s_to_lowercase = s.downcase
  s_converted = s_to_lowercase.delete("^a-z0-9")
  result = true
  size = (s_converted.length / 2)
  l = 0
  r = (s_converted.length - 1)
  while l < size
     if s_converted[l] != s_converted[r]
         result = false
         break
     end
     l += 1
     r -= 1
  end
  result
end

# Time complexity: Big O(n) where n is the length of the string. The complexity of this solution depends of the input (the length of the string in this case)
