# name: 'little shop'
# author: 'Shubin Pavlik'
# version: 0.4
#
# ruby_version: 2.3.3
# encoding: utf-8

require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

current_path = File.dirname(__FILE__)

collection = ProductCollection.from_dir(current_path)
collection.sort(:price, :down)

puts "Что хотите купить:\n\n"
cart = Cart.new

loop do
  # output products list
  collection.products.each_with_index do |item, index|
    puts "#{index + 1}. #{item}"
  end
  puts "0. Выход\n\n"

  # select product
  user_input = STDIN.gets.to_i
  item = collection.to_a[user_input - 1]
  # check if user want to end shopping
  if user_input.zero?
    puts "\nВы купили:\n\n"
    puts cart.take_list
    puts "\nС Вас - #{cart.price} руб. Спасибо за покупки!\n\n"
    exit
  end

  if item.count > 0
    cart.add(item)
    puts "\nВы выбрали: #{item}\n\n"
  else
    puts "Товара нет в наличии!\n\n"
  end
  puts "Всего товаров на сумму: #{cart.price} руб.\n\n"
end
