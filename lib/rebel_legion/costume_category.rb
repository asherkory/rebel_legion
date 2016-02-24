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
    i = 0
    costumes.each do |costume| 
      i += 1
      puts "#{i}. ".colorize(:yellow) + "#{costume.name}"
    end
  end

end