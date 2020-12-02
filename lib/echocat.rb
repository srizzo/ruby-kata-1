# frozen_string_literal: true

require 'publication'

module Echocat
  def self.run
    puts '#####################################################################'
    puts 'Print out all books and magazines:'
    puts

    Publication.all.each do |publication|
      puts publication
    end


    puts
    puts
    puts '#####################################################################'
    puts 'Find a book or magazine by its isbn:'
    puts

    puts Publication.find_by_isbn('5454-5587-3210')
    puts Publication.find_by_isbn('2145-8548-3325')


  end
end
