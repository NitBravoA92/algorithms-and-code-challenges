const isPalindrome = (str) => {
  const originalStr = str.toLowerCase()
  let reverseStr = ''
  for(let i = (str.length - 1); i >= 0; i--) {
    reverseStr += str[i]
  }
  reverseStr = reverseStr.toLowerCase()

  return originalStr === reverseStr
}

console.log(isPalindrome("abcd"))
// Time Complexity = Big O(n)