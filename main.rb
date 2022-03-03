require_relative "./student"
require_relative "./teacher"
require_relative "./book"

class App
  def initialize
    @books = []
    @people = []
    @exit = false
  end

  def run
    receive_user_input
  end

  private
    def display_options
      puts "1 - List all books"
      puts "2 - List all people"
      puts "3 - Create a person"
      puts "4 - Create a book"
      puts "5 - Create a rental"
      puts "6 - List all rentals for a given person id"
      puts "7 - Exit"
    end

    def receive_user_input
      loop do 
        display_options
        print "Option: "
        user_input = gets.chomp
        case user_input.to_i
        when 1
          @books.each do |book|
            puts "Title:#{book.title}, Author:#{book.author}"
          end
        when 2
          @people.each do |person|
            puts "[#{person.class}] Name:#{person.name},ID: #{person.id} Age:#{person.age}"
          end
        when 3
          print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
          option = gets.chomp
          case option.to_i
          when 1
            create_student
          when 2
            create_teacher
          end
        when 4
          create_book
        when 7
          @exit = true
        else
          "You pressed a wrong option"
        end
        break if @exit
      end      
    end

    def create_student
      print "Age: "  
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Has parent permission? [Y/N] "
      parent_permission = gets.chomp
      parent_permission = (parent_permission.downcase == 'n') ? false : true
      @people << Student.new(age.to_i, nil, name: name, parent_permission: parent_permission)
      puts "Student created successfully"
    end

    def create_teacher
      print "Age: "  
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Specialization: "
      specialization = gets.chomp
      @people << Teacher.new(age.to_i, specialization, name: name)
      puts "Teacher created successfully"
    end

    def create_book
      print "Title: "  
      title = gets.chomp
      print "Author: "
      author = gets.chomp
      @books << Book.new(title, author)
      puts "Book created successfully"
    end
end

def main
  app = App.new
  app.run
end

main