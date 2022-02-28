class Person
  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name
  attr_reader :id, :parent_permission
  attr_writer :age

  private

  def of_age?
    return true if @age >= 18

    false
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
