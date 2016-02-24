class RebelLegion::Costume
  attr_accessor :name, :url, :details # probably a bunch more
  attr_reader :costume_category

  @@all = []

  def initialize(name, costume_category, url) 
    @name = name
    self.costume_category = costume_category
    @url = url
    @details = []
    @@all << self
  end

  def self.all
    @@all
  end

  def costume_category=(category)
    @costume_category = category
    category.add_costume(self)
  end

  def view_details # reads the details data from @details array
    i = 0
    details.each do |detail|
      i += 1
      puts "#{i}. #{detail}"
    end
  end
end