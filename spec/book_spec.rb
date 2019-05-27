require 'spec_helper'
require 'rspec/collection_matchers'

describe Book do

    before :each do
        @book = Book.new "Title", "Author", :category
    end

    describe "#new" do
      it "returns a new book object" do
        @book.should be_an_instance_of Book
      end

      it "throws an ArgumentError when given fewer than 3 parameters" do
        # lambda { Book.new "Title", "Author" }.should raise_exception ArgumentError
        expect { Book.new "Title", "Author" }.to raise_exception ArgumentError
      end

    describe "#title" do
      it "return the correct title" do
        expect(@book.title).to eq "Title"
      end
    end
    describe "#title" do
      it "return the correct author" do
        expect(@book.author).to eq "Author"
      end
    end
    describe "#title" do
      it "return the correct category" do
        expect(@book.category).to eq :category
      end
    end
    
    end
end
