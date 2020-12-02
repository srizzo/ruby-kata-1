# frozen_string_literal: true

require 'publication'

module Echocat
  def self.run
    puts 'Print out all books and magazines:'
    puts

    Publication.all.each do |publication|
      puts publication
    end
  end
end
