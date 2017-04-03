# ruby_version: 2.3.3
# encoding: utf-8
class ProductCollection
  attr_reader :products

  PRODUCT_CATEGORIES = %w(books films disks).freeze

  def initialize(products)
    @products = products
  end

  def self.from_dir(path)
    products = []
    PRODUCT_CATEGORIES.each do |category|
      products += Dir[path + "/data/#{category}/*.txt"].collect do |file|
        Object.const_get(category.chop.capitalize).from_file(file)
      end
    end
    new(products)
  end

  def to_a
    @products
  end

  # sort by :price, :count, :name and ascending(:up) descending(:down)
  def sort(type, in_order)
    @products.sort_by!(&type)
    @products.reverse! if in_order == :down
    @products
  end
end
