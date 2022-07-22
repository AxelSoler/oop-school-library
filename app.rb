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
    @rentals = []
  end

  def list_menu
    puts ''
    puts 'Please choose an option by enterin a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def select_option # rubocop:disable Metrics/CyclomaticComplexity
    selected = gets.chomp
    case selected
    when '1' then list_books
    when '2' then list_persons
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rentals
    when '7' then abort('Thank you for using School Library App')
    else
      puts 'error, select another number'
      select_option
    end
  end

  def run
    puts 'Welcome to School Library App'
    list_menu
    select_option
  end

  def list_books
    @persons.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    list_menu
    select_option
  end

  def list_persons
    @persons.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    list_menu
    select_option
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
    select_option
  end

  def create_student
    puts 'Age: '
    selected_age = gets.chomp
    puts 'Name: '
    selected_name = gets.chomp
    puts 'Has parent permission? [Y/N]: '
    selected_permission = gets.chomp.downcase == 'y'
    student = Student.new(selected_age, selected_name, selected_permission)
    @persons.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age: '
    teacher_age = gets.chomp
    puts 'Name: '
    teacher_name = gets.chomp
    puts 'Specialization: '
    teacher_specialization = gets.chomp
    teacher = Teacher.new(teacher_age, teacher_name, teacher_specialization)
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
    select_option
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) title: #{book.title}, Author: #{book.author}"
    end
    index_book = gets.chomp
    puts ''
    puts 'Select a person from the following list by number'
    @persons.each_with_index do |person, index|
      puts "#{index}) #{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    index_person = gets.chomp
    puts ''
    puts 'Date: '
    selected_date = gets.chomp
    rental = Rental.new(selected_date, @books[index_book.to_i], @persons[index_person.to_i])
    @rentals.push(rental)
    puts 'Rental created successfully'
    list_menu
    select_option
  end

  def list_rentals
    @persons.each do |person|
      puts "#{person.class} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts 'Select ID of person: '
    selected_person_id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id == selected_person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by: #{rental.book.author}"
      end
    end
    list_menu
    select_option
  end
end
