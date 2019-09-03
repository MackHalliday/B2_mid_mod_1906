class Book < ApplicationRecord
    has_many :author_books
    has_many :authors, through: :author_books

  def self.average_length
    average(:pages)
  end
end
