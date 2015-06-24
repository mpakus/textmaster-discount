class BasketItem
  attr_accessor :item, :count, :total_price
  def initialize(item:, count:, total_price:)
    @item, @count, @total_price = item, count, total_price
  end
end
