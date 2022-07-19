require_relative './person'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'

class App
  attr_reader :people, :books

  def initialize
    @persons = []
    @books = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    list_menu
  end

  def list_persons
    @persons.each do |person|
      puts "#{person.class} name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    list_menu
  end

  def create_person(person)
    Person.new(person)
  end

  def create_book(book)
    Book.new(book)
  end

  def create_rental(rental)
    Rental.new(rental)
  end

  def list_rentals(rental)
    puts rental
  end
end
