
class Grid
  attr_reader :display, :ships, :ship_hole

  def initialize
    @ships = []
    @fired_at = []
  end

  def display
  puts "    1   2   3   4   5   6   7   8   9   10"
  puts "  -----------------------------------------"
    10.times do |count|
      rows = {A: 1, B: 2, C: 3, D: 4, E: 5,
      F: 6, G: 7, H: 8, I: 9, J: 10}
      output = ""
      row = count + 1
      10.times do |count_2|
        column = count_2 + 1
        fill = []
        @ships.each do |ship|
          ship.locations.each do |hole|
            if hole.x == column && hole.y == row
              fill.push(true)
            else
              fill.push(false)
            end
          end
        end

        if fill.include?(true) && @fired_at.include?([column, row])
          output << "| X "
        elsif fill.include?(true)
          output << "| O "
        else
          output << "|   "
        end
      end
      puts rows.key(row).to_s + " " + output  + "|"
    end
    puts "  -----------------------------------------"

  end


  def place_ship(ship, x, y, bool)
    ship.place(x, y, bool)
    @ships.each do |ship_2|
      if ship_2.overlaps_with?(ship)
        return false
      end
    end
    @ships.push(ship)
  end

  def has_ship_on?(x, y)
    @ships.each do |ship|
      if ship.covers?(x, y)
        return true
      end
    end
    false
  end

  def fire_at(x, y)
    if x > 10 || y > 10
      false
    elsif @fired_at.include?([x, y])
      false
    else
      @ships.each do |ship|
        if ship.fire_at(x, y)
          @fired_at.push([x, y])
          return true
        end
      end
    end
    false
  end

  def sunk?
    if @ships.length == 0
      return false
    else
      @ships.each do |ship|
        ship.locations.each do |hole|
          if hole.hit? == false
            return false
          end
        end
      end
      true
    end
  end

  def x_of(x_coord)
    if x_coord == 'A1'
      1
    elsif x_coord == 'G1'
      1
    elsif x_coord == 'D6'
      6
    else
      10
    end
  end

  def y_of(y_coord)
    if y_coord == 'A1'
      1
    elsif y_coord == 'G1'
      7
    elsif y_coord == 'D6'
      4
    else
      4
    end
  end



end
