Rules.instance.engine do |product|

  if product.count >= 3 && product.item.code == 'AP1'
    product.total_price = product.count * 4.50
  end

  if product.count == 2
    product.total_price = product.item.price
  end

  product
end
