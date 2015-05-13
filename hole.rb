class Hole
  attr_reader :x, :y

  def initialize(args)
    @x = args[0]
    @y = args[1]
  end

  def hit
    @hit = true
  end

  def hit?
    @hit == true
  end

end
