# Leetcode link: https://leetcode.com/problems/binary-tree-inorder-traversal/submissions/1108546310/

# @param {TreeNode} root
# @return {Integer[]}
def inorder(node, list)
  return list if node == nil

  inorder(node.left, list)
  list << node.val
  inorder(node.right, list)
end

def inorder_traversal(root)
  list = []
  inorder(root, list)
end

# The Time complexity is O(n), where n is the number of nodes in the tree. This is because we are visiting each node exactly once during the inorder traversal.
# The space complexity is also O(n) because we are using an additional list to store the inorder traversal values. The size of the list will be equal to the number of nodes in the tree.
