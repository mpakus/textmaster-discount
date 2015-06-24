require_relative 'checkout/item'
require_relative 'checkout/basket_item'
require_relative 'checkout/rules'
require_relative '../config/rules'

class Checkout
  def initialize(rules)
    @rules  = rules
    @basket = {}
  end

  def scan(item)
    if @basket.key?(item.code)
      @basket[item.code].count += 1
    else
      @basket[item.code] = BasketItem.new(item: item, count: 1, total_price: item.price)
    end
  end

  def total
    total_price = 0
    @basket.each do |key, product|
      total_price += @rules.run(product).total_price
    end
    total_price
  end
end
