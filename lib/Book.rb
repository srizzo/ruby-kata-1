# frozen_string_literal: true

require 'csv'

class Book
  class << self
    def read_from_csv(path:)
      CSV.new(File.new(path, 'r:bom|utf-8'),
              col_sep: ';',
              headers: true)
         .map(&:to_h)
         .map { |record| record.update('authors' => record['authors'].split(',')) }
    end
  end
end
