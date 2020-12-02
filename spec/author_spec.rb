# frozen_string_literal: true

require 'author'

describe Author do
  context '.read_from_csv' do
    let(:authors) { Author.read_from_csv(path: File.expand_path('./fixtures/authors.csv', File.dirname(__FILE__))) }
    it 'loads all records' do
      expect(authors.length).to eq(6)
    end
  end
end
