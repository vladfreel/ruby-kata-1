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

def get_by_isbn(isbn, imported_books, imported_magazines)
  imported_books.find_all { |book| book.isbn == isbn }.push(*imported_magazines.find_all { |magazine| magazine.isbn == isbn })
end

def get_by_authors(authors, imported_books, imported_magazines)
  imported_books.find_all { |book| book.authors == authors }.push(*imported_magazines.find_all { |magazine| magazine.authors == authors })
end

def sort_by_title(imported_books, imported_magazines)
  imported_books.push(*imported_magazines).sort_by(&:title)
end
p 'ALL IMPORTED AUTHORS'
p imported_authors
p '*'*100
p 'ALL IMPORTED BOOKS'
p imported_books
p '*'*100
p 'ALL IMPORTED MAGAZINES'
p imported_magazines
p '*'*100
p 'GET BOOKS AND MAGAZINES BY ISBN'
p get_by_isbn('3214-5698-7412', imported_books, imported_magazines)
p '*'*100
p 'GET BOOKS AND MAGAZINES BY AUTHORS'
p get_by_authors('null-walter@echocat.org', imported_books, imported_magazines)
p '*'*100
p 'SORT BOOKS AND MAGAZINES BY TITLE'
p sort_by_title(imported_books, imported_magazines)
p '*'*100

