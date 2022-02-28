require_relative './person'
require_relative './teacher'
require_relative './student'

person1 = Person.new(15)
p(person1)
p(person1.can_use_services?)

person2 = Person.new(15, parent_permission: false)
p(person2)
p(person2.can_use_services?)

person3 = Person.new(18, parent_permission: false)
p(person3)
p(person3.can_use_services?)

student = Student.new(15, 'A', name: 'Student')
p(student)
puts(student.play_hooky)

teacher = Teacher.new(15, 'CS', name: 'Teacher')
p(teacher)
p(teacher.can_use_services?)
