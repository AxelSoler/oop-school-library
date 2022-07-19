require_relative './person'

class Student < Person
  attr_reader :rental

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
    @rental = []
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
