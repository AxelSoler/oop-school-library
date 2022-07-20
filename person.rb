require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :name, :age

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rental = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
