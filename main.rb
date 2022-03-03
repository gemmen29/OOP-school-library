require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @exit = false
  end

  def run
    receive_user_input
  end

  private

  def display_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def receive_user_input
    loop do
      display_options
      print 'Option: '
      user_input = gets.chomp
      if user_input.to_i == 7
        @exit = true
      else
        manage_user_input(user_input.to_i)
      end
      break if @exit
    end
  end

  def manage_user_input(user_input)
    case user_input
    when 1
      display_list_of_books
    when 2
      display_list_of_person
    when 3
      create_student_or_teacher
    when 4
      create_book
    when 5
      create_rental
    when 6
      display_rentals
    else
      puts 'You pressed a wrong option'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N] '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase != 'n'
    @people << Student.new(age.to_i, nil, name: name, parent_permission: parent_permission)
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age.to_i, specialization, name: name)
    puts 'Teacher created successfully'
  end

  def create_student_or_teacher
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option.to_i
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_list_of_books(5)
    book_num = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    display_list_of_person(5)
    person_num = gets.chomp
    print 'Date: '
    date = gets.chomp
    if book_num.to_i < @books.length && person_num.to_i < @people.length
      @rentals << Rental.new(date, @books[book_num.to_i], @people[person_num.to_i])
      puts 'Rental created successfully'
    else
      puts 'Please enter a valid book num or valid person num'
    end
  end

  def display_list_of_books(from = 1)
    @books.each_with_index do |book, index|
      print "#{index}) " if from == 5
      puts "Title: \"#{book.title}\", Author:#{book.author}"
    end
  end

  def display_list_of_person(from = 2)
    @people.each_with_index do |person, index|
      print "#{index}) " if from == 5
      puts "[#{person.class}] Name:#{person.name}, ID: #{person.id}, Age:#{person.age}"
    end
  end

  def display_rentals
    print 'ID of person: '
    person_id = gets.chomp
    display_list_of_rental(person_id.to_i)
  end

  def display_list_of_rental(id = 1)
    @rentals.select { |rental| rental.person.id == id }.each do |rental|
      puts "Date:#{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

def main
  app = App.new
  app.run
end

main
