# frozen_string_literal: true

require 'active_model'
require 'book'
require 'magazine'

class Publication
  include ActiveModel::Model

  class_attribute :records

  class << self
    def all
      self.records ||= [*Book.read_from_csv(path: File.expand_path('../data/books.csv', File.dirname(__FILE__))), *Magazine.read_from_csv(path: File.expand_path('../data/magazines.csv', File.dirname(__FILE__)))]
    end

    def find_by_isbn(isbn)
      all.find { |publication| publication.isbn == isbn }
    end

    def find_all_by_author(author_email)
      all.select { |publication| publication.authors.any? { |author| author.email == author_email } }
    end
  end
end
