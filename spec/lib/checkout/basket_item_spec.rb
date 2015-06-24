require 'checkout/item'
require 'checkout/basket_item'

describe BasketItem do
  it 'has right accessors' do
    item    = create_item
    product = create_product(item: item)
    expect(product.item).to        eq item
    expect(product.count).to       eq 1
    expect(product.total_price).to eq item.price
  end
end
