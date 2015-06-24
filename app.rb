require_relative 'lib/checkout'

fr1 = Item.new(code: 'FR1', name: 'Fruit tea', price: 3.11)
ap1 = Item.new(code: 'AP1', name: 'Apple',     price: 5.00)
cf1 = Item.new(code: 'CF1', name: 'Coffee',    price: 11.23)

co  = Checkout.new(Rules.instance)
co.scan(fr1)
co.scan(ap1)
co.scan(fr1)
co.scan(cf1)

puts co.total

co  = Checkout.new(Rules.instance)
co.scan(fr1)
co.scan(fr1)

puts co.total

co  = Checkout.new(Rules.instance)
co.scan(ap1)
co.scan(ap1)
co.scan(fr1)
co.scan(ap1)

puts co.total
