require_relative './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :parent_permission
  attr_reader :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rentals(rental)
    @rentals << rental
  end
end
