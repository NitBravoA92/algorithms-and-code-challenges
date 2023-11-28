# Leetcode: https://leetcode.com/problems/remove-duplicates-from-sorted-list/submissions/1108382155/

class LinkedList
  def initialize(head = nil)
      @head = head
  end

  def remove_duplicate
      return @head if @head == nil || @head.next == nil

      current_node = @head

      while current_node.next != nil
          if current_node.val == current_node.next.val
              new_next_node = current_node.next.next
              current_node.next = new_next_node
          else
              current_node = current_node.next
          end
      end

      @head
  end
end

def delete_duplicates(head)
  linkedlist = LinkedList.new(head)

  linkedlist.remove_duplicate
end

# Time Complexity: O(n) where n is the number of nodes in the linked list. Depending of the number of nodes in the linked list, we will have more or less iterations.
# Space Complexity: O(1) where we are not using any extra space. We are just using the same linked list to remove the duplicates.
