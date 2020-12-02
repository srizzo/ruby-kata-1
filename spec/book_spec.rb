# frozen_string_literal: true

require 'book'

describe Book do
  context '.read_from_csv' do
    let(:books) { Book.read_from_csv(path: File.expand_path('./fixtures/books.csv', File.dirname(__FILE__))) }
    it 'loads all records' do
      expect(books.length).to eq(8)
    end

    it 'interprets correct encoding' do
      expect(books[1].title).to eq('Das große GU-Kochbuch Kochen für Kinder')
    end

    it 'parses authors as list' do
      expect(books[1].authors.map(&:email)).to eq(['null-ferdinand@echocat.org', 'null-lieblich@echocat.org'])
    end
  end
end
