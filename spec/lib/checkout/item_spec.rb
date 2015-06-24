require 'checkout/item'

describe Item do
  it 'has right accessors' do
    item = Item.new(code: 'AP1', name: 'Apple', price: 5.00)
    expect(item.code).to  eq 'AP1'
    expect(item.name).to  eq 'Apple'
    expect(item.price).to eq 5.0
  end
end
