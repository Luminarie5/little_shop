# ruby_version: 2.3.3
# encoding: utf-8
class ProductCollection

  PRODUCT_CATEGORIES = %w(books films disks).freeze

  def initialize(storage)
    @storage = storage
  end

  def self.from_dir(path)
    storage = []
    PRODUCT_CATEGORIES.each do |category|
      storage += Dir[path + "/data/#{category}/*.txt"].collect do |file|
        Object.const_get(category.chop.capitalize).from_file(file)
      end
    end
    new(storage)
  end

  def to_a
    @storage
  end

  def to_list
    @storage.each_with_index { |item, index| puts "#{index + 1}. #{item.to_s}" }
    puts '0. Выход'
    puts
  end

  # sort by :price, :count, :name and ascending(:up) descending(:down)
  def sort(type, in_order)
    @storage.sort_by!(&type)
    @storage.reverse! if in_order == :down
    @storage
  end
end
