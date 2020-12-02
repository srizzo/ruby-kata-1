# frozen_string_literal: true

require 'csv'

class Magazine
  class << self
    def read_from_csv(path:)
      CSV.new(File.new(path, 'r:bom|utf-8'),
              col_sep: ';',
              headers: %w[title isbn authors published_at])
         .to_a
         .slice(1..-1)
         .map(&:to_h)
         .map do |record|
        record.update('authors' => record['authors'].split(','),
                      'published_at' => Date.parse(record['published_at'], 'dd.MM.YYYY'))
      end
    end
  end
end
