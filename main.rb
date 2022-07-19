require_relative './app'

class Main
  def list_menu
    puts 'Welcome to School Library App'
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

  def select_option
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
    list_menu
  end
end

def main
  App.new.run
end

main
