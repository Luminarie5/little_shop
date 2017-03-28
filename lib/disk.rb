# ruby_version: 2.3.3
# encoding: utf-8
class Disk < Product
  attr_accessor :name, :artist, :genre, :year

  def initialize(hash)
    super
    @name = hash[:name]
    @artist = hash[:artist]
    @genre = hash[:genre]
    @year = hash[:year]
  end

  def to_s
    "Альбом #{artist} - «#{name}», #{genre}, #{year} год, #{price} руб. (осталось #{count})"
  end

  def self.from_file(path_to_file)
    hash = {}
    hash[:name], hash[:artist], hash[:genre], hash[:year],
        hash[:price], hash[:count] = *File.readlines(path_to_file, encoding: 'utf-8').map(&:chomp).compact
    Disk.new(hash)
  end
end
