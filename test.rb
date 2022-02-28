require_relative './person'
require_relative './teacher'
require_relative './student'


person = Person.new(15)
p (person)
p (person.can_use_services?)

person = Person.new(15, parent_permission: false)
p (person)
p (person.can_use_services?)

person = Person.new(18, parent_permission: false)
p (person)
p (person.can_use_services?)