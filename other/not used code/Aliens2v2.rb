require 'gosu'
class Alien2v2


 attr_reader :x, :y, :width, :height

  def initialize(window, x, y)
    @x = rand * 800
    @y = 0
    @width = 80
    @height = 36
    @image = Gosu::Image.new(window, "Resources/Alien2.png", false)
    @dt = 0
    @alife = 10
  
	

	if @y <= 2 
		@side = rand * 2
	end
	if @side >= 1
		@vx = -1
	elsif @side < 1 
		@vx = 1
	end
	@vy = 0.5

  end
#  def alife
 # 	@alife = 10
 # end

  def gethit
  	@dt = @dt + 2
  end

  def alife
  	if @dt == 0
  		@alife = 10
 elsif @dt == 10
 		@alife = 0
 	end

  	if @alife <= 0
  		return true
  	else
  		return false
  	end
  end
 
  def move

	@y = @y + @vy
	@x = @x + @vx

		if @x > 720
			@vx = -3
		end
		if @x < 80
			@vx = 3
		end	
		
		if @x < 81
			@vx = 1.8
		end
		if @x > 719
			@vx = -1.8
		end

		if rand < 0.006 and @vx < 0
			@vx = 1.8
		end
		if rand < 0.006 and @vx > 0
			@vx = -1.8
		end



  end
  def shoot
  	if rand < 0.037 and @y % 2.0000 == 0.0000
  		return true
  	else

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