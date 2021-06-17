class TreasureMap
  def initialize
    @map = Hash.new(".")
  end

  def add_resource(x, y, res)
    @map[[x, y]] = res
  end

  def remove_resource(x, y)
    @map.delete([x, y])
  end

  def to_s
    return "Map is empty." if @map.empty?
    max_x = min_x = @map.keys.first[0]
    max_y = min_y = @map.keys.first[1]
    output = ""
    coordinates = ""

    @map.each do |k,v|
      if k[0] > max_x
        max_x = k[0]
      elsif k[0] < min_x
        min_x = k[0]
      end
      if k[1] > max_y
        max_y = k[1]
      elsif k[1] < min_y
        min_y = k[1]
      end
      coordinates << "%s → %s\n" % [v, k] 
    end 

    max_y.downto(min_y).each do |y|
      (min_x..max_x).each do |x| 
        output << @map[[x, y]]
      end
      output << "\n"
    end

    output + coordinates
  end
end

FOOD = "F"
WATER = "W"
TREASURE = "X"

map = TreasureMap.new
map.add_resource(0, 1, FOOD)
map.add_resource(11, 0, FOOD)
map.add_resource(6, -2, WATER)
map.add_resource(-1, -5, TREASURE)

puts map.to_s

puts "Generating a map with all negative coordinates"
map.remove_resource(0,1)
map.remove_resource(11, 0)
map.remove_resource(6, -2)
map.add_resource(-2, -3, WATER)
map.add_resource(-30, -1, FOOD)
puts map.to_s

puts "Generating and outputting empty map"
empty_map = TreasureMap.new
puts empty_map.to_s