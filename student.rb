require_relative './person'

class Student < Person
  attr_reader :rental

  def initialize(age, name = 'Unknown', parent_permission, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
    @rental = []
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
