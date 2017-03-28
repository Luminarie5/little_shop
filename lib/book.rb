# ruby_version: 2.3.3
# encoding: utf-8
class Book < Product
  attr_accessor :name, :genre, :author

  def initialize(hash)
    super
    @name = hash[:name]
    @genre = hash[:genre]
    @author = hash[:author]
  end

  def to_s
    "Книга «#{name}», #{genre}, автор — #{author}, #{price} руб. (осталось #{count})"
  end

  def self.from_file(path_to_file)
    hash = {}
    hash[:name], hash[:genre], hash[:author],
        hash[:price], hash[:count] = *File.readlines(path_to_file, encoding: 'utf-8').map(&:chomp).compact
    Book.new(hash)
  end
end
