# ruby_version: 2.3.3
# encoding: utf-8
class Product
  attr_accessor :count, :price

  def initialize(hash)
    @count = hash[:count].to_i
    @price = hash[:price].to_f.round(2)
  end

  def from_file(path_to_file)
    raise NotImplementedError
  end
end
