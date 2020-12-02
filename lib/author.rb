# frozen_string_literal: true

require 'csv'
require 'active_model'

class Author
  include ActiveModel::Model

  attr_accessor :email, :first_name, :last_name

  class << self
    def read_from_csv(path:)
      CSV.new(File.new(path, 'r:bom|utf-8'),
              col_sep: ';',
              headers: %w[email first_name last_name])
         .to_a
         .slice(1..-1)
         .map(&:to_h)
    end

    def find(email)
      new(email: email)
    end
  end

  def to_s
    "Author: #{email}, #{first_name}, #{last_name}"
  end
end
