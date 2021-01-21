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
          params = {
            email: author[0],
            first_name: author['firstName'],
            last_name: author['lastName']
          }

          all_authors << Author.new(params)
        end
        
        all_authors
      end

      def import_books
        all_books = []
        books = File.join(File.expand_path('../data', __dir__), 'books.csv')
        CSV.foreach(books, col_sep: ';', headers: true) do |book|
          params = {
            title: book[0],
            description: book['description'],
            authors: book['authors'],
            isbn: book['isbn']
          }

          all_books << Book.new(params)
        end
        
        all_books
      end

      def import_magazines
        all_magazines = []
        magazines = File.join(File.expand_path('../data', __dir__), 'magazines.csv')
        CSV.foreach(magazines, col_sep: ';', headers: true) do |magazine|
          params = {
            title: magazine[0],
            published_at: magazine['publishedAt'],
            authors: magazine['authors'],
            isbn: magazine['isbn']
          }

          all_magazines << Magazine.new(params)
        end
        
        all_magazines
      end
  end
end