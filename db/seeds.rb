# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author_1 = Author.create(name: "Author Name 1")
author_2 = Author.create(name: "Author Name 2")
author_3 = Author.create(name: "Author Name 3")
author_4 = Author.create(name: "Author Name 4")
author_5 = Author.create(name: "Author Name 5")

book_1 = Book.create(title: "Book 1 Title", pages: 100, publication_year: 2016)
  author_book_1 = book_1.author_books.create!(book: book_1, author: author_1)
book_2 = Book.create(title: "Book 2 Title", pages: 150, publication_year: 2017)
  author_book_2 = book_2.author_books.create!(book: book_2, author: author_2)
book_3 = Book.create(title: "Book 3 Title", pages: 200, publication_year: 2018)
  author_book_3 = book_3.author_books.create!(book: book_3, author: author_3)
book_4 = Book.create(title: "Book 4 Title", pages: 250, publication_year: 2019)
  author_book_4 = book_4.author_books.create!(book: book_4, author: author_4)
  author_book_5 = book_4.author_books.create!(book: book_4, author: author_5)
