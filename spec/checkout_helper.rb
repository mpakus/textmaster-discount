module CheckoutHelper
  def create_item(code: 'AP1', name: 'Apple', price: 5.00)
    Item.new(code: code, name: name, price: price)
  end

  def create_product(item: nil, count: 1)
    item = create_item unless item
    BasketItem.new(item: item, count: count, total_price: item.price * count)
  end
end
