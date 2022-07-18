class < Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end