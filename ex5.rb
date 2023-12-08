class Node
  attr_accessor :data, :next_node
  def initialize(data)
    @data = data
    @next_node = nil
  end
end
class CircularLinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end
  # Додавання елементу в кінець списку
  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
      new_node.next_node = @head
    else
      temp = @head
      while temp.next_node != @head
        temp = temp.next_node
      end
      temp.next_node = new_node
      new_node.next_node = @head
    end
  end
  # Виведення елементів списку
  def display
    temp = @head
    begin
      puts temp.data
      temp = temp.next_node
    end while temp != @head
  end
end
# Приклад використання
list = CircularLinkedList.new
list.append(1)
list.append(2)
list.append(3)
puts "Елементи кругового зв'язаного списку:"
list.display