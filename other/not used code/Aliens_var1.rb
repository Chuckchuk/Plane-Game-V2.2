require 'gosu' 
class Aliens_var1


 attr_reader :x, :y, :width, :height


  def initialize(window, x, y)
    @x = rand * 800
    @y = 0
    @width = 80
    @height = 36
    @image = Gosu::Image.new(window, "Resources/Alien.png", false)
       

	if @y <= 2 
		@side = rand * 2
	end
	if @side >= 1
		@vx = -1
	elsif @side < 1 
		@vx = 1
	end
	@vy = 1
 
  end
 
  def move
	@y = @y + @vy
	@x = @x + @vx

		if @x > 720
			@vx = -4
		end
		if @x < 80
			@vx = 4
		end	
		
		if @x < 81
			@vx = 2
		end
		if @x > 719
			@vx = -2
		end
		
  end

  def yvalue
    if @y >= 990
     return true
    end
 
  end


  def draw
   @image.draw(@x - @width/2, @y - @height/2, 1)
  end

end #class