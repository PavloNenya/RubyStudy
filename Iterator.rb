class LengthIterator
  def initialize(array)
    @array = array.sort_by { |a| a.length }
    @index = 0
  end

  def first
    @array[0]
  end

  def next
    value = @array[@index]
    @index += 1
    value
  end

  def is_done?
    @index == @array.length - 1
  end

  def current_item
    @array[@index]
  end

  def has_next?
    @index < @array.length
  end

  def previous
    value = @array[@index]
    @index -= 1
    value
  end

  def has_previous?
    @index > 0
  end

  def rewind
    @index = 0
  end
end

fruits = %w(orange apple mango nut pineapple dragon_fruit)
array_iterator = LengthIterator.new(fruits)

while array_iterator.has_next?
  puts array_iterator.next
end

puts("\n")

fruits.each do |fruit|
  puts fruit
end
