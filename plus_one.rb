# leetcode link: https://leetcode.com/problems/plus-one/submissions/1102393577/ 
def plus_one(digits)
  return [] if digits.length == 0

  convert_to_str = digits.join("")
  convert_to_integer = convert_to_str.to_i
  sum_one = convert_to_integer + 1
  result_to_str = sum_one.to_s
  result_array = result_to_str.split("")
  result = result_array.map {|c| c.to_i }

  result
end