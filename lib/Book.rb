# frozen_string_literal: true

require 'active_model'
require 'csv'

class Book
  include ActiveModel::Model

  attr_accessor :title, :isbn, :authors, :description

  class << self
    def read_from_csv(path:)
      CSV.new(File.new(path, 'r:bom|utf-8'),
              col_sep: ';',
              headers: true)
         .map(&:to_h)
         .map { |record| record.update('authors' => record['authors'].split(',').map { |email| Author.find(email) }) }
         .map { |record| Book.new(record) }
    end
  end
end
