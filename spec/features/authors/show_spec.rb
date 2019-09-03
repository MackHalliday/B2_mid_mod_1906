# As a user,
# When I visit the Book Index Page,
#   Then I see each author's name is a link
# When I click the link
#   Then I am taken to an Author Show Page where I see the author with that id including the author's:
#   - name
#   - the title of each book they have written
#   - the average number of pages for all of their books

require 'rails_helper'

RSpec.describe "Author Show Page" do
  describe "When I visit the author show page" do
    before(:each) do
      @author_1 = Author.create(name: "Author Name 1")
      @author_2 = Author.create(name: "Author Name 2")
      @author_3 = Author.create(name: "Author Name 3")
      @author_4 = Author.create(name: "Author Name 4")
      @author_5 = Author.create(name: "Author Name 5")

      @book_1 = Book.create(title: "Book 1 Title", pages: 100, publication_year: 2016)
        @author_book_1 = @book_1.author_books.create!(book: @book_1, author: @author_1)
      @book_2 = Book.create(title: "Book 2 Title", pages: 150, publication_year: 2017)
        @author_book_2 = @book_2.author_books.create!(book: @book_2, author: @author_2)
      @book_3 = Book.create(title: "Book 3 Title", pages: 200, publication_year: 2018)
        @author_book_3 = @book_3.author_books.create!(book: @book_3, author: @author_3)
      @book_4 = Book.create(title: "Book 4 Title", pages: 250, publication_year: 2019)
        @author_book_4 = @book_4.author_books.create!(book: @book_4, author: @author_4)
        @author_book_5 = @book_4.author_books.create!(book: @book_4, author: @author_5)
      @book_5 = Book.create(title: "Book 4 Title", pages: 300, publication_year: 2020)
        @author_book_6 = @book_5.author_books.create!(book: @book_5, author: @author_5)


      @all_books = [@book_1, @book_2, @book_3, @book_4, @book_5]
      @all_authors = [@author_1, @author_2, @author_3, @author_4, @author_5]
    end

    it "I can click on an authors name in the Book index page and views authors info" do

      visit '/books'

      within "#book-#{@book_4.id}" do
        click_link ("#{@author_5.name}")
      end

      expect(current_path).to eq("/authors/#{@author_5.id}")

      expect(page).to have_content(@author_5.name)
      expect(page).to have_content(@book_4.title)
      expect(page).to have_content(@book_5.title)
      expect(page).to have_content(275)
    end
  end
end
