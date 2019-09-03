require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'relationships' do
    it { should have_many :author_books}
  end
end
