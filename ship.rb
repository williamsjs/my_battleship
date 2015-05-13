class Ship
  attr_reader :length, :locations

  def initialize(length)
    @length = length
  end

  def place(x_val, y_val, bool)
    if @locations.nil?
      @locations = []
      length.times do |count|
        if bool
          @locations.push(Hole.new([x_val+count, y_val]))
        else
          @locations.push(Hole.new([x_val, y_val+count]))
        end
      end
    end
  end

  def covers?(x, y)
    @locations.each do |holes_object|
      if holes_object.x == x && holes_object.y == y
        return true
      end
    end
    false
  end

  def overlaps_with?(ship_object)
    @locations.each do |holes_object|
      if ship_object.covers?(holes_object.x, holes_object.y)
        return true
      end
    end
    false
  end

  def fire_at(x, y)
    @locations.each do |holes_object|
      if holes_object.x == x && holes_object.y == y
        holes_object.hit
        return true
      end
    end
    false
  end

  def sunk?
    if @locations.nil?
      return false
    else
      bool_arr = []
      @locations.each do |item|
        bool_arr.push(item.hit?)
      end
      if bool_arr.include?(false)
        false
      else
        true
      end
    end
  end


end
