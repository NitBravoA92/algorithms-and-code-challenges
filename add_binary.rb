# leetcode link: https://leetcode.com/problems/add-binary/submissions/1104474404/
def add_binary(a, b)
  kept_val = 0
  a_size = a.length
  b_size = b.length

  i = 0
  j = 0
  bigger_s = ""
  smaller_s = ""

  if a_size >= b_size
      i = a_size - 1
      j = b_size - 1
      bigger_s = a
      smaller_s = b
  else
      i = b_size - 1
      j = a_size - 1
      bigger_s = b
      smaller_s = a
  end

  last_element = 0
  result = ''

  while i >= 0
      sum = 0

      if j >= 0
          last_element = smaller_s[j].to_i
      else
          last_element = 0
      end

      sum = bigger_s[i].to_i + last_element + kept_val
      kept_val = 0

      if sum <= 1
          result = "#{sum}#{result}"
      end

      if sum == 2
          result = "0#{result}"
          kept_val = 1
      end

      if sum > 2
          result = "1#{result}"
          kept_val = 1
      end

      if (i <= 0) && (sum > 1)
          result = "1#{result}"
      end

      i -= 1
      j -= 1
  end

  result
end