# frozen_string_literal: true

module Echocat
  class << self
    def run
      welcome
    end

    def welcome
      puts 'Hello, welcome to the coolest library of books and magazines!'
      puts 'But first, type your name.'

      @name = $stdin.gets.chomp

      puts "Hi #{@name}, glad to have you with us, choose one option"
    end
  end
end
