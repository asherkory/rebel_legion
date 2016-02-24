class RebelLegion::Costume
  attr_accessor :name, :url, :details # probably a bunch more
  attr_reader :costume_category

  def initialize(name, costume_category, url) 
    @name = name
    self.costume_category = costume_category
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def costume_category=(category)
    @costume_category = category
    category.add_costume(self)
  end

  def view_details # reads the details data from Scraper, makes readable
  end


end