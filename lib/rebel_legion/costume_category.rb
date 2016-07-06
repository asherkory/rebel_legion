class RebelLegion::CostumeCategory
  attr_accessor :costumes, :name, :url

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @costumes = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.display_all_names
    i = 0
    @@all.each do |category| 
      i += 1
      puts "#{i}. ".colorize(:yellow) + "#{category.name}" 
    end
  end

  def add_costume(costume)
    @costumes << costume
  end

  def display_costume_names
    RebelLegion::Scraper.scrape_costumes_for_category(self) if costumes.empty?      
    costumes.each.with_index(1) do |costume, i| 
      puts "#{i}. ".colorize(:yellow) + "#{costume.name}"
    end
  end

  def new_costume(name, url)
    RebelLegion::Costume.new(name, self, url)
  end

end