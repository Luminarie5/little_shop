# ruby_version: 2.3.3
# encoding: utf-8

# cart for products
class Cart
  attr_reader :price

  def initialize
    @products = []
    @price = 0
  end

  def add(product)
    @products << product
    @price += product.price
    product.count -= 1
  end

  def take_list
    @products.map(&:to_s)
  end
end
