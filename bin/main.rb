require './authors' 
require './magazines' 
require './books' 
require 'csv'

authors_csv = CSV.read("../data/authors.csv")
books_csv = CSV.read("../data/books.csv")
magazines_csv = CSV.read("../data/magazines.csv")


authors = CSV.parse(File.read("../data/authors.csv"), headers: false).drop(1)
imported_authors = []
authors.each do |author|
  auth = author[0].split(";");
  imported_authors << Author.new(auth[0], auth[1], auth[2])
end

books = CSV.parse(File.read("../data/books.csv"), headers: false).drop(1)
imported_books = []
books.each do |book|
  b = book[0].split(";");
  imported_books << Book.new(b[0], b[1], b[2], b[3])
end

magazines = CSV.parse(File.read("../data/magazines.csv"), headers: false).drop(1)
imported_magazines = []
magazines.each do |magazine|
  b = magazine[0].split(";");
  imported_magazines << Magazine.new(b[0], b[1], b[2], b[3])
end
p imported_authors
p '*'*100
p imported_books
p '*'*100
p imported_magazines

