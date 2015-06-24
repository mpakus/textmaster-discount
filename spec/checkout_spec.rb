require 'checkout'

describe Checkout do
  before(:all){
    Rules.instance.engine do |product|

      if product.count >= 3 && product.item.code == 'AP1'
        product.total_price = product.count * 4.50
      end

      if product.count == 2
        product.total_price = product.item.price
      end

      product
    end

    @fr1 = Item.new(code: 'FR1', name: 'Fruit tea', price: 3.11)
    @ap1 = Item.new(code: 'AP1', name: 'Apple',     price: 5.00)
    @cf1 = Item.new(code: 'CF1', name: 'Coffee',    price: 11.23)
  }

  it 'works on seria A: FR1, AP1, FR1, CF1 = $19.34' do
    co = Checkout.new(Rules.instance)
    co.scan(@fr1)
    co.scan(@ap1)
    co.scan(@fr1)
    co.scan(@cf1)
    expect(co.total).to eq 19.34
  end

  it 'works on seria B: FR1, FR1 = $3.11' do
    co = Checkout.new(Rules.instance)
    co.scan(@fr1)
    co.scan(@fr1)
    expect(co.total).to eq 3.11
  end

  it 'works on seria C: AP1, AP1, FR1, AP1 = $16.61' do
    co = Checkout.new(Rules.instance)
    co.scan(@ap1)
    co.scan(@ap1)
    co.scan(@fr1)
    co.scan(@ap1)
    expect(co.total).to eq 16.61
  end
end
