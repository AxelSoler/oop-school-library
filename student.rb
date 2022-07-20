require_relative './person'

class Student < Person
  attr_reader :rental

  def initialize(age, name, parent_permission, classroom: nil)
    super(age, name, parent_permission)
    @classroom = classroom
    @rental = []
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
