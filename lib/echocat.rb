# frozen_string_literal: true

module Echocat
  class << self
    def run
      setup
      clear
      welcome
    end

    def setup
      @authors, @books, @magazines = ImportData.import_all
    end

    def welcome
      puts ['Hello, welcome to the coolest library of books and magazines!', 'But first, type your name.']

      @name = $stdin.gets.chomp

      return leave if @name == '0'

      if @name.nil? || @name.empty?
        puts 'Invalid name, try again or press 0 to exit.'
        puts ''
        welcome
      end

      clear

      puts "Hi #{@name}, glad to have you with us, choose one option"
      options
    end

    def options
      options_to_select = [
        '',
        '1 - Print out all books and magazines',
        '2 - Find a book or magazine by its isbn',
        '3 - Find all books and magazines by their authors’ email',
        '0 - Exit'
      ]
      puts 'Select one of these options:'
      puts options_to_select
      select_option
    end

    def select_option
      @selected = $stdin.gets.chomp

      case @selected
      when '1'
        puts 'ok, do 1'
      when '2'
        find_by_isbn
      when '3'
        puts 'ok, do 3'
      when '0'
        leave
      else
        clear
        puts 'Invalid option, try again or press 0 to exit.'
        options
      end
    end

    def clear
      system ('clear')
      system ('cls')
    end

    def leave
      puts 'Thanks for using the Cool Library System.'
    end

    def find_by_isbn
      puts 'Type the ISNB you wanna find a book or Magazine'

      @isbn = $stdin.gets.chomp

      @books_founded = @books.select {|book| book.isbn == @isbn}
      @magazines_founded = @magazines.select {|magazine| magazine.isbn == @isbn}

      puts ''
      if @books_founded.empty?
        puts 'No books were founded for this ISBN'
      else
        puts "Here the books founded for the ISBN: #{@isbn}"
        puts @books_founded.map(&:title)  
      end

      puts ''
      if @magazines_founded.empty?
        puts 'No Magazines were founded for this ISBN'
      else
        puts "Here the Magazines founded for the ISBN: #{@isbn}"
        puts @magazines_founded.map(&:title)  
      end

      options
    end
  end
end
