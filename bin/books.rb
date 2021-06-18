class Book
  attr_accessor :title, :isbn, :authors, :description
  def initialize(title, isbn, authors, description)
    @title = title
    @isbn = isbn
    @authors = authors
    @description = description
  end
end