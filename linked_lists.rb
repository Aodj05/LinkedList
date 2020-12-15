# frozen_string_literal: true

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    # adds new node to end of list
    current_node = @head
    until current_node.next_node == nil
        current_node = current_node.next_node
    end
    current_node.next_node = Node.new(value)
  end

  def prepend(value)
    # adds new node to front of list
    last_head = @head
    @head = Node.new(value)
    @head.next_node = last_head
  end

  def size
    return 0 if !@head
    current_node = @head
    counter = 0
    while current_node do
      current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  def head
    # return first node in list
    @head.value
  end

  def tail
    # return last node in list
    current_node = @head
    until current_node.next_node == nil
        current_node = current_node.next_node
    end
    current_node.value
  end

  def at(index)
    # return node at given index
    current_node = @head
    current = 0
    until current == index
        current_node = current_node.next_node
        current += 1
    end
    current_node.value
end

  def pop
    # remove last element in list
    return nil if !@head
    if !@head.next_node
        @head = nil
        return
    end

    prev = @head
    current_node = @head.next_node
    while current_node.next_node do
        current_node = current_node.next_node
        prev = prev.next_node
    end
    @tail = prev
    prev.next_node = nil
    current_node.value
  end

  def contains?(value)
    # return true if value exists return false if not
    there = false
    current_node = @head
    until current_node == nil
        there = true if current_node.value == value
        current_node = current_node.next_node
    end
    there
  end

  def find(value)
    # return index of node with the value, or nil
    current_node = @head
    current_index = 0
    index_value = nil
    until current_node == nil
        index_value = current_index if current_node.value == value
        current_node = current_node.next_node
        current_index += 1
    end
    index_value || 'nil'
  end

  def to_s
    # represent linked list objects as strings,
    current_node = @head
    until current_node == nil
        print "(#{current_node.value}) ->"
        current_node = current_node.next_node
    end
  end

  def insert_at(value, index)
    # insert a node with the value at a given index
    if !@head
        @head = Node.new(value)
        return
    end
    if index == 0
        insert_at(value)
        return
    end
    previous = at(index - 1) || get_last()
    node = Node.new(value, previous.next_node)
    previous.next_node = node
  end

  def remove_at(index)
    # remove node at given index (then update it)
    return if !@head
    if index == 0
        @head = @head.next_node
        return
    end

    previous = at(index - 1)
    if @previous || !previous.next_node
        return
    end
    previous.next_node = previous.next_node.next_node
end
end

class Node

  attr_reader :value
  attr_accessor :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new

list.prepend(5)

# Prepend another node to the start of the list.
list.prepend(4)

# Prepend another node to the start of the list.
list.prepend(3)

# Append an item to the end of the list.
list.append(6)

# Append another item to the end of the list.
list.append(7)

# Return the size of the list.
puts "The list has #{list.size} nodes."

# Return the first node..
puts "The first node is #{list.head}."

# Return the last node.
puts "The last node is #{list.tail}."

# Return the node at the given index.
puts "The node at index 2 is #{list.at(2)}."

# Display list before removing last item with pop.
puts "The list before popping out the last item:"
puts list.to_s

# Pop the last item out of the list.
puts "Removed #{list.pop} from the list."

# The list after popping the last item.
puts "The list after popping out the last item:"
p list.to_s

# Check to see if 5 is contained in the list.
puts "Contains 5? #{list.contains?(5)}"

# Check to see if 10 is contained in the list.
puts "Contains 10? #{list.contains?(10)}"

# Check to see where/if 6 is in the list.
puts "6 is located at #{list.find(6)}"

# Check to see where/if 10 is in the list.
puts "10 is located at #{list.find(10)}"

# View the list as a string.
puts list.to_s
