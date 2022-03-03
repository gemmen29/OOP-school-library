class App
  def initialize
    @books = []
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
          puts "#{book.title} #{book.author}"
        end
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