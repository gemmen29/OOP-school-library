class Person
  def initialize(age, name = "Unknown", parent_permission = "true")
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id, :name, :parent_permission
  attr_writer :name, :age

  def is_of_age?
    if @age >= 18
      true
    end
    false
  end


  private :is_of_age?
end