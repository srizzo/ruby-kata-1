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
  end
end
