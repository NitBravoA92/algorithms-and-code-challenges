=begin
  A LINKED LIST:
    * is a linear data structure
    * contains a lis of nodes, which are objects that have a value and a pointer to the next node in the list
    * the value attribute in all the nodes should be of the same data type
    * each node is connect to its next node in the list through a pointer
    * doesn't have indexes, so searching an element in the list could be a little slow sometimes
    * has a head node which is the first node in the list
    * the last node in the list should point to NULL (nil in ruby)
    * the nodes aren't stored continuously in memory like the arrays
  
    LINKED LIST STRUCTURE:
    [node1] --> [node2] --> [node3] --> [node4] --> [node5] --> [node6] --> [node7] --> [node8] --> nil

    node1 = head
    node8 = last node of the list... it points to nil
=end

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  def initialize()
    @head = nil
  end

  def show
    if is_empty?
      puts "The linked list is empty"
      return
    end

    currentNode = @head
    until is_last?(currentNode)
      print "#{currentNode.value} "
      currentNode = currentNode.next
    end
    puts "\n------------------------------------"
  end

  # insert a new element at the end of the linked list
  def push(data)
    node = Node.new(data)

    if is_empty?
      @head = node
      return node
    end

    currentNode = @head

    until is_last?(currentNode)
      currentNode = currentNode.next
    end

    currentNode.next = node
  end

  # insert a new element in the head of the linked list
  def unshift(data)
    node = Node.new(data)

    if is_empty?
      @head = node
      return
    end

    node.next = @head
    @head = node
  end

  # insert a new element before an specific element
  def insert_before(data, before)
    node = Node.new(data)

    if is_empty?
      @head = node
      return
    end

    if @head.value == before
      node.next = @head
      @head = node
      return
    end

    prevNode = @head
    nextNode = prevNode.next

    until nextNode.value == before
      prevNode = nextNode
      nextNode = prevNode.next
    end
    node.next = nextNode
    prevNode.next = node
  end

  # remove an specific element from the linked list
  def remove_at(element)
    # if the linkedlist is empty
    return @head if is_empty?

    # if the element is in the head
    if @head.value == element
      newHead = @head.next
      @head = newHead
      return @head
    end

    currentNode = @head.next
    prevElement = @head

    while currentNode.next != nil
      if currentNode.value == element
        prevElement.next = currentNode.next
        return currentNode
      end
      prevElement = currentNode
      currentNode = currentNode.next
    end
  end

  #remove the last element from the linkedlist
  def pop
    return @head if is_empty?

    currentNode = @head
    prevElement = nil
    until is_last?(currentNode)
      prevElement = currentNode
      currentNode = currentNode.next
    end
    currentNode = nil
    prevElement.next = nil
  end

  private
  def is_empty?
    @head.nil?
  end

  def is_last?(node)
    node.next.nil?
  end
end

list = LinkedList.new

puts "------------------------------------"
puts "----INSERT 2,3,0,4,6 IN THE LIST----"
puts "------------------------------------"

list.push(2)
list.push(3)
list.unshift(0)
list.push(4)
list.push(6)

p list
puts "------------------------------------"
puts "-----INSERT 1,5,100 IN THE LIST-----"
puts "------------------------------------"

list.insert_before(1, 2)
list.insert_before(5, 6)
list.insert_before(100, 3)

p list
puts "------------------------------------"
puts "----REMOVE 100,6 FROM THE LIST------"
puts "------------------------------------"

list.remove_at(100)
list.pop

p list

puts "------------------------------------"
puts "---SHOW THE LINKED LIST ELEMENTS----"
puts "------------------------------------"

list.show