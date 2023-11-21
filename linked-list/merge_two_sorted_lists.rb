# leetcode link: https://leetcode.com/problems/merge-two-sorted-lists/submissions/1103622365
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

class LinkedList
  attr_accessor :head

  def initialize(_head)
      @head = _head
  end

  def size
      cont = 0
      return cont if @head == nil
      
      current_node = @head

      while current_node != nil
          cont += 1
          current_node = current_node.next
      end
      cont
  end

  def add_sorted_element(node)
      return @head if node == nil

      if @head == nil
          @head = node
          return @head 
      end

      if @head.next == nil
          if @head.val <= node.val
              @head.next = node
          else
              node.next = @head
              @head = node 
          end
          return @head
      end

      current_node = @head

      while current_node != nil
          if (current_node.next == nil)
              current_node.next = node
              break
          end

          if (node.val < current_node.val) && current_node == @head
              node.next = current_node
              current_node = node
              @head = current_node
              break
          end

          if (current_node.val <= node.val) && (current_node.next.val > node.val)
              node.next = current_node.next
              current_node.next = node
              break
          end

          current_node = current_node.next
      end
  end

  def shift
      return @head if @head == nil

      node = @head
      @head = @head.next
      node.next = nil

      node
  end
end

def merge_two_lists(list1, list2)
  linked_list1 = LinkedList.new(list1)
  linked_list2 = LinkedList.new(list2)
  size_list2 = linked_list2.size

  while size_list2 > 0
      list_element = linked_list2.shift
      linked_list1.add_sorted_element(list_element)
      size_list2 -= 1
  end

  result_head = linked_list1.head
end

# test the algorithm
list1 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
list2 = ListNode.new(1, ListNode.new(3, ListNode.new(4)))

p merge_two_lists(list1, list2)