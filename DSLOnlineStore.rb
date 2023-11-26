class DiscountCalculatorDSL
  def initialize
    @discount_rules = []
  end

  def order_total(&block)
    instance_eval(&block) if block_given?
  end

  def item(name, price, quantity)
    @current_item = { name: name, price: price, quantity: quantity }
  end

  def discount_percentage(percentage)
    discount_amount = (@current_item[:price] * @current_item[:quantity]) * (percentage / 100.0)
    @discount_rules << { item: @current_item[:name], discount: discount_amount }
  end

  def calculate_discount(order)
    total_discount = 0

    @discount_rules.each do |rule|
      item = order[:items].find { |i| i[:name] == rule[:item] }
      total_discount += rule[:discount] if item
    end

    total_discount
  end
end

calculator = DiscountCalculatorDSL.new

order = {items: [{ name: 'TV', price: 1499, quantity: 1, discount: 25},
                 { name: 'Pillow', price: 125, quantity: 4, discount: 15 }] }

calculator.order_total do
  order[:items].each { |i|
    item(i.values[0], i.values[1], i.values[2])
    discount_percentage(i.values[3])
  }
end

discount = calculator.calculate_discount(order)
puts "Total discount: $#{discount}"