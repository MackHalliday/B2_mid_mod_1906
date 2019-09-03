require 'rails_helper'

RSpec.describe "Book Index Page" do
  describe "When I visit the book index page" do
    before(:each) do
      @book_1 = Book.create(title: "Book 1 Title", pages: 100, publication_year: 2016)
      @book_2 = Book.create(title: "Book 2 Title", pages: 150, publication_year: 2017)
      @book_3 = Book.create(title: "Book 3 Title", pages: 200, publication_year: 2018)
      @book_4 = Book.create(title: "Book 4 Title", pages: 250, publication_year: 2019)

      @author_1 = @book_1.authors.create(name: "Author Name 1")
      @author_2 = @book_2.authors.create(name: "Author Name 2")
      @author_3 = @book_2.authors.create(name: "Author Name 3")
      @author_4 = @book_3.authors.create(name: "Author Name 4")
      @author_5 = @book_4.authors.create(name: "Author Name 5")

      @all_books = [@book_1, @book_2, @book_3, @book_4]
    end

    it "I can see a list of all of the items "do

      visit '/books'
      @all_books.each do |book|

        within "#item-#{book.id}" do
          expect(page).to have_content(book.title)
          expect(page).to have_content(book.pages)
          expect(page).to have_content(book.publication_year)
          expect(page).to have_content(book.authors)
        end
      end
    end
  end
end
