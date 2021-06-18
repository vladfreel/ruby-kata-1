class Magazine
  attr_accessor :title, :isbn, :authors, :publishedAt
  def initialize(title, isbn, authors, publishedAt)
    @title = title
    @isbn = isbn
    @authors = authors
    @publishedAt = publishedAt
  end
end