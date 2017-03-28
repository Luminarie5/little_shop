# ruby_version: 2.3.3
# encoding: utf-8
class Bucket
  def initialize
    @bucket = []
    @bucket_price = 0
  end

  def add(product)
    @bucket << product
    if product.count > 0
      @bucket_price += product.price
      product.count -= 1
      puts "Вы выбрали: #{product}\n\n"
    else
      puts "Товара нет в наличии!\n\n"
    end
  end

  def total
    puts "Всего товаров на сумму: #{@bucket_price} руб.\n\n"
  end

  def go_home
    puts "Вы купили:\n\n"
    to_list
    puts "\nС Вас - #{@bucket_price} руб. Спасибо за покупки!\n\n"
    exit
  end

  def to_list
    @bucket.each_with_index { |item, index| puts "#{index + 1}. #{item}" }
  end

  def fill(products)
    loop do
      products.to_list
      user_input = STDIN.gets.chomp.to_i
      item = products.to_a[user_input - 1]
      go_home if user_input.zero?
      add(item)
      total
    end
  end
end
