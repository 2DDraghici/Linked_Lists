require_relative './node'

class LinkedLists
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head = new_node if @head.nil?
    if @tail.nil?
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    counter = 0
    current_node = @head
    until current_node.nil?
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  attr_reader :head, :tail

  def at(index)
    current_node = @head
    index.times do
     return nil if current_node == @tail

      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    nil if size < 1
    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    i = 0
    current_node = @head
    while i <= size
      return true if current_node.value == value

      i += 1
      current_node = current_node.next_node
    end
    false
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    print 'nil'
  end

  def display_node
    current_node = @head
    print "the value of the current node is #{current_node.value}" if current_node.value == 3
    puts
    print current_node.next_node
  end

  def insert_at(value, index)
    return puts 'Position unavailable' if index > size

    inserted_node = Node.new(value, at(index))
    previous_node = at(index - 1)
    previous_node.next_node = inserted_node
  end

  def remove_at(index)
    return puts 'Position unavailable' if index >= size

    @head = at(1) if index.zero?
    if at(index) == @tail
      @tail = at(index - 1)
      @tail.next_node = nil
    end

    previous_node = at(index - 1)
    next_node = at(index + 1)
    previous_node.next_node = next_node
  end
end

list = LinkedLists.new
list.append(3)
list.append(3)
list.insert_at(4, 1)
list.remove_at(3)
list.to_s
puts

puts list.at(0).next_node
