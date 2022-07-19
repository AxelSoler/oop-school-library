class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(person, date)
    @rental.push([person, date])
    person.rental = self
  end
end
