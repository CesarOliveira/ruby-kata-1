require 'csv'

module ImportData
  class << self
      def import_all
        [import_authors, import_books, import_magazines]
      end

      def import_authors
        all_authors = []
        authors = File.join(File.expand_path('../data', __dir__), 'authors.csv')
        CSV.foreach(authors, col_sep: ';', headers: true) do |author|
          all_authors << Author.new(author[0], author['firstName'], author['lastName'])
        end

        all_authors
      end

      def import_books
        all_books = []
        books = File.join(File.expand_path('../data', __dir__), 'books.csv')
        CSV.foreach(books, col_sep: ';', headers: true) do |book|
          all_books << Book.new(book[0], book['description'], book['authors'], book['isbn'])
        end

        all_books
      end

      def import_magazines
        all_magazines = []
        magazines = File.join(File.expand_path('../data', __dir__), 'magazines.csv')
        CSV.foreach(magazines, col_sep: ';', headers: true) do |magazine|
          all_magazines << Magazine.new(magazine[0], magazine['publishedAt'], magazine['authors'], magazine['isbn'])
        end

        all_magazines
      end
  end
end