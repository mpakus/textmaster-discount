require 'checkout/rules'

describe Rules do
  it 'is Singleton ' do
    expect(Rules.instance).to eq Rules.instance
  end

  context 'engine run' do
    before(:all){
      Rules.instance.engine do |product|
        if product.count == 2
          product.total_price = product.item.price
        end
        if product.count >= 3
          product.total_price = (product.count - 1) * product.item.price
        end
        product
      end
    }

    it 'rules for 2 items' do
      product = create_product(count: 2)
      expect(Rules.instance.run(product).total_price).to eq product.item.price
    end

    it 'rules for 3 and more items' do
      product = create_product(count: 3)
      expect(Rules.instance.run(product).total_price).to eq product.item.price * 2
    end
  end
end
