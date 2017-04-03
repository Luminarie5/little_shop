# ruby_version: 2.3.3
# encoding: utf-8
class Film < Product
  attr_accessor :name, :year, :director

  def initialize(hash)
    super
    @name = hash[:name]
    @year = hash[:year]
    @director = hash[:director]
  end

  def to_s
    "Фильм «#{name}», #{year} год, реж. #{director}, "\
    "#{price} руб. (осталось #{count})"
  end

  def self.from_file(path_to_file)
    hash = {}
    lines = File.readlines(path_to_file, encoding: 'utf-8').map(&:chomp).compact
    hash[:director], hash[:name], hash[:year], hash[:price],
        hash[:count] = *lines
    Film.new(hash)
  end
end
