class RebelLegion::CLI
  attr_accessor :current_category

  def call
    # RebelLegion::Scraper.new
    welcome
    menu
    goodbye
  end

  def welcome
    puts "THE REBEL LEGION: An International Star Wars Costuming Organization"
    puts "Welcome to the Rebel Legion Costume Standards Viewer."
  end

  def menu
    input = nil
    while input != "exit"
      view_category_list
      # how do I exit????
    end
  end

  def view_category_list
    puts "Select a category of costumes to view by entering a number, or type 'exit':"
    # RebelLegion::CostumeCategory.display_all_names
    puts "1. Jedi" # temp
    puts "2. Pilots" # temp
    input = gets.strip
    if input != "exit"
      view_costume_list(input.to_i - 1)
    else
      # how do I exit????
    end
  end

  def view_costume_list(number)
    # RebelLegion::CostumeCategory.all[number].display_costume_names
    categories = [["1. Luke RotJ", "2. Obi-Wan Kenobi"], ["1. Wedge Antilles", "2. Corran Horn"] ] # temp
    puts categories[number] # temp
    @current_category = number
    puts "To view a costume's standards for Rebel Legion membership, enter its number."
    puts "To return to the main menu, enter 'main'. Or, type 'exit'." 
    input = gets.strip
    case input
      when "main"
        view_category_list
      when "exit"
      else
        view_costume_details(input.to_i - 1)
    end
  end

  def view_costume_details(number)
    # RebelLegion::Costume.all[number].view_details
    puts "#{number}. placeholder" # temp
    puts "To go back, enter 'back'."
    puts "To return to the main menu, enter 'main'. Or, type 'exit'." 
    input = gets.strip
    case input
      when "back"
        view_costume_list(@current_category)
      when "main"
        view_category_list
      when "exit"
    end
  end

  def goodbye
    puts "May the Force be with you...always."
  end
end