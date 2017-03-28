# name: 'little shop'
# author: 'Shubin Pavlik'
# version: 0.4
#
# ruby_version: 2.3.3
# encoding: utf-8

require_relative './lib/product'
require_relative './lib/film'
require_relative './lib/book'
require_relative './lib/disk'
require_relative './lib/product_collection'
require_relative './lib/cart'

current_path = File.dirname(__FILE__)

collection = ProductCollection.from_dir(current_path)
collection.sort(:price, :down)

puts 'Что хотите купить:'
bucket = Cart.new
bucket.fill(collection)
