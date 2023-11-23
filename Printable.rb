module Printable
  def print_info
    puts "Information about the object:"
    instance_variables.each do |var|
      puts "#{var}: #{instance_variable_get(var)}"
    end
  end
end

class Person
  include Printable
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def introduce
    puts "Hello, my name is #{@name}, I'm #{@age} years old, and I am #{@gender}."
  end
end

obj = Person.new("Pablo", 20, "male")
obj.print_info