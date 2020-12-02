# frozen_string_literal: true

require 'csv'

class Author
  class << self
    def read_from_csv(path:)
      CSV.new(File.new(path, 'r:bom|utf-8'),
              col_sep: ';',
              headers: %w[email first_name last_name])
         .to_a
         .slice(1..-1)
         .map(&:to_h)
    end
  end
end
