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
    Rental.new(rental)
  end

  def list_rentals(rental)
    puts rental
  end
end
