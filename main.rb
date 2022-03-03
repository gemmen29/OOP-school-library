require_relative "./person"
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
            puts "Name:#{person.name}, Age:#{person.age}"
          end
        when 3
          print "Age: "  
          age = gets.chomp
          print "Name: "
          name = gets.chomp
          print "Has parent permission? [Y/N] "
          parent_permission = gets.chomp
          parent_permission = (parent_permission.downcase == 'n') ? false : true
          @people << Person.new(age, name: name, parent_permission: parent_permission)
        when 4
          print "Title: "  
          title = gets.chomp
          print "Author: "
          author = gets.chomp
          @books << Book.new(title, author)
        when 7
          @exit = true
        else
          "You pressed a wrong option"
        end
        break if @exit
      end      
    end
end

def main
  app = App.new
  app.run
end

main