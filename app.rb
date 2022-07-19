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
      puts "#{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    list_menu
  end

  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input the number]: '
    selected = gets.chomp
    case selected
    when '1' then create_student
    when '2' then create_teacher
    else
      puts 'wrong number, select student (1) or teacher (2)'
      create_person
    end
    list_menu
  end

  def create_student
    puts 'Age: '
    selected_age = gets.chomp
    puts 'Name: '
    selected_name = gets.chomp
    puts 'Has parent permission? [Y/N]: '
    selected_permission = gets.chomp.downcase == 'y'
    student = Student.new(selected_name, selected_age, selected_permission)
    @persons.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age: '
    selected_age = gets.chomp
    puts 'Name: '
    selected_name = gets.chomp
    puts 'Specialization: '
    selected_specialization = gets.chomp
    teacher = Teacher.new(selected_name, selected_age, selected_specialization)
    @persons.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title: '
    selected_title = gets.chomp
    puts 'Author: '
    selected_author = gets.chomp
    book = Book.new(selected_title, selected_author)
    @books.push(book)
    puts 'Book created successfully'
    list_menu
  end

  def create_rental(rental)
    puts 'Select a book from the following list by number'
    @books.each do |book, index|
      puts "#{index}) title: #{book.title}, Author: #{book.author}"
    end
    selected_book = gets.chomp
    puts ''
    puts 'Select a person from the following list by number'
    @persons.each do |person, index|
      puts "#{index}) #{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = gets.chomp
    puts''
    puts 'Date: '
    selected_date = gets.chomp
    Rental.new(selected_date, selected_book, selected_person)
    puts 'Rental created successfully'
    list_menu
  end

  def list_rentals
    puts 'ID of person: '
    selected_person_id = gets.chomp
    puts 'Rentals: '
    @person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.name} by: #{rental.book.author}"
    end
    list_menu
  end
end
