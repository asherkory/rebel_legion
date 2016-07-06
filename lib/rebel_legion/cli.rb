class RebelLegion::CLI
  attr_accessor :current_category, :current_category_number

  def call
    RebelLegion::Scraper.new
    input = nil
    welcome
    view_category_list
    goodbye
  end

  def welcome
    puts "THE REBEL LEGION: An International Star Wars Costuming Organization!".colorize(:red)
    puts "Welcome to the Rebel Legion Costume Standards Viewer."
  end

  def view_category_list
    puts "Select a category of costumes to view by entering a number, or type 'exit':".colorize(:light_red)
    RebelLegion::CostumeCategory.display_all_names
    input = gets.strip
    view_costume_list(input.to_i - 1) if input != "exit"
  end

  def view_costume_list(number)
    @current_category_number = number
    @current_category = RebelLegion::CostumeCategory.all[number]
    current_category.display_costume_names
    puts "To view a costume's standards for Rebel Legion membership, enter its number.".colorize(:light_red)
    puts "To return to the main menu, enter 'main'. Or, type 'exit'.".colorize(:light_red)
    input = gets.strip
    unless input == "exit"
      if input == "main"
        view_category_list
      else
        view_costume_details(input.to_i - 1)
      end
    end
  end

  def view_costume_details(number)
    @current_category.costumes[number].view_details
    puts "To go back, enter 'back'.".colorize(:light_red)
    puts "To return to the main menu, enter 'main'. Or, type 'exit'.".colorize(:light_red)
    input = gets.strip
    unless input == "exit"
      case input
      when "back"
        view_costume_list(@current_category_number)
      when "main"
        view_category_list
      end
    end
  end

  def goodbye
    puts "May the Force be with you...always.".colorize(:red)
  end
end