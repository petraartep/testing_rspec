require 'spec_helper'
require 'rspec/collection_matchers'
require 'rake'

describe "Library Object" do

  before :all do
    lib_arr = [
        Book.new("Harry Potter: The Sorcerer's Stone", "J. K. Rowling", :fantasy),
        Book.new("Harry Potter: The Chambers of Secrets", "J. K. Rowling", :fantasy),
        Book.new("Harry Potter: The Prisoner of Azkaban", "J. K. Rowling", :fantasy),
        Book.new("Harry Potter: The Goblet Of Fire", "J. K. Rowling", :fantasy),
        Book.new("Harry Potter: The Order Of Phoenix", "J. K. Rowling", :fantasy),
        Book.new("Harry Potter: The Half-Blood Prince", "J. K. Rowling", :fantasy),
        Book.new("Harry Potter: The Deathly Hallows", "J. K. Rowling", :fantasy)
    ]

    File.open "books.yml", "w" do |f|
        f.write YAML::dump lib_arr
    end
end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        lib.should have(0).books
      end
    end

    context "with a yaml file name parameters" do
      it "has seven books" do 
        @lib.should have(7).books
      end

    end
  end

    it "returns all the books in a given category" do
        expect(@lib.get_books_in_category(:fantasy).length).to eql 7
        # @lib.get_books_in_category(:fantasy).expect(length).to eql (7)
    end

    it "accepts new books" do
        expect(@lib.add_book(Book.new("Harry Potter: The Cursed Child", "J. K. Rowling", :drama)))
        @lib.get_book("Harry Potter: The Cursed Child").should be_an_instance_of Book
    end
    
    it "saves the library" do
       books = @lib.books.map { |book| book.title }
       @lib.save "our_new_library.yml"
       lib2 = Library.new "our_new_library.yml" 
       books2 = lib2.books.map { |book| book.title }
       expect(books).to eql books2
    end
end