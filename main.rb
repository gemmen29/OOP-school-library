require_relative "./people"

class App
  def initialize
    @books = []
    @people = []
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
      display_options
      user_input = gets.chomp
      case user_input
      when 1
        @books.each do |book|
          puts "Title:#{book.title}, Author:#{book.author}"
        end
      when 2
        @people.each do |person|
          puts "Name:#{person.name}, Age:#{person.author}"
        end
      when 3  
        puts "Age: "  
        age = gets.chomp
        puts "Name: "
        name = gets.chomp
        puts "Has parent permission? [Y/N]"
        parent_permission = gets.chomp
        parent_permission = (parent_permission.downcase == 'n') ? false : true
        people << Person.new(age, name, parent_permission)
      else
        "You pressed a wrong option"
      end      
    end
end

def main
  app = App.new
  app.run
end

main