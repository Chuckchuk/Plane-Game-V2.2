require 'gosu'
class Alien


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

	@down = rand * 3


	@vy = 1

  end
 
  def move

  	@y = @y + @vy
	@x = @x + @vx

	

  def moving	
	if @down >= 0.4
		@vy = 1
	else
		@vy = 2.2
	end

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
  end #moving
  	def away
		if @vx > 0
			@vy = -0.2
			@vx =  8
		end
		if @vx < 0
			@vy = -0.2
			@vx =  -8
		end
	end #away


  end #move



	def out
		if @x < -10 or @x > 810
			return true
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