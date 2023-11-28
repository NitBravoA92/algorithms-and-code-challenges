# https://leetcode.com/problems/climbing-stairs/submissions/1107801428/

# @param {Integer} n
# @return {Integer}
def calculate_climb(prev, curr, cont)
  return curr if cont == 0
  aux = prev + curr
  calculate_climb(curr, aux, cont - 1)
end

def climb_stairs(n)
  calculate_climb(0, 1, n)
end

# test the solution
puts climb_stairs(2)
puts climb_stairs(3)
puts climb_stairs(4)
puts climb_stairs(5)

# time complexity: O(n) -> Each recursive call reduces the value of n by 1, so the number of recursive calls is proportional to n.
