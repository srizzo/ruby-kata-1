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

    puts
    puts
    puts '#####################################################################'
    puts 'Find all books and magazines by their `authors`’ email:'
    puts

    puts Publication.find_all_by_author('null-ferdinand@echocat.org')
    puts Publication.find_all_by_author('null-walter@echocat.org')

    puts
    puts
    puts '#####################################################################'
    puts 'Print out all books and magazines with all their details sorted by `title`:'
    puts

    Publication.sorted_by_title.each do |publication|
      puts publication
    end
  end
end
