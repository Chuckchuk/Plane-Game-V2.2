class Bullet

attr_reader :x, :y, :width, :height
  



  def initialize(window, x, y)
    @x = x
    @y = y
    @width = 10
    @height = 10
    @image = Gosu::Image.new(window, "Resources/bullet.png", false)
  end

  def move
    @y = @y - 6
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end

  def yValue
    if @y == 0
      return true
    else

    end
  end
end