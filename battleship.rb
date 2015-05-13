require "./hole.rb"
require "./grid.rb"
require "./ship.rb"

def get_user_input
  gets.chomp
end

module MakeGrid
  def grid
    Grid.new
  end
end

class Player
  include MakeGrid
  attr_reader :name, :ships

  def initialize(name)
    @name = name
    @ships = []
  end

  def place_ships(lengths)
      ship_1 = Ship.new(lengths[0])
      ship_2 = Ship.new(lengths[1])
      @ships.push(ship_1)
      @ships.push(ship_2)
      puts "#{name}, where would you like to place a ship of length #{lengths[0]}?\nAcross or Down?"
      puts "#{name}, where would you like to place a ship of length #{lengths[1]}?\nAcross or Down?"
  end

end

class HumanPlayer < Player

  def initialize(name="Dave")
    @name = name
  end

end


class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"
  end
end

scott = HumanPlayer.new("Scott")
