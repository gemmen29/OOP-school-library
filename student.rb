require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def join(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
