require 'gosu'
class Aliens3


 attr_reader :x, :y, :width, :height

  def initialize(window, x, y)
    @x = rand * 800
    @y = 0.00
    @width = 120
    @height = 44
    @image = Gosu::Image.new(window, "Resources/Alien3.png", false)
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
	@vy = 1
  @vz = 0.5

  end
#  def alife
 # 	@alife = 10
 # end

  def gethit
  	@dt = @dt + 2
  end

  def alife
  	if @dt == 0
  		@alife = 40
 elsif @dt == 40
 		@alife = 0
 	end

  	if @alife <= 0
  		return true
  	else
  		return false
  	end
  end
 
  def move

	@y = @y + @vy - @vz
	@x = @x + @vx

  def moving
		if @x > 720
			@vx = -3
		end
		if @x < 80
			@vx = 3
		end	
		
		if @x < 81
			@vx = 0.5
		end
		if @x > 719
			@vx = -0.5
		end

		if rand < 0.002 and @vx < 0
			@vx = 0.5
		end
		if rand < 0.002 and @vx > 0
			@vx = -0.5
		end
  end #moving
  def away
    if @vx > 0
      @vy = -0.2
      @vx =  6
    end
    if @vx < 0
      @vy = -0.2
      @vx =  -6
    end
  end #away

  end #move



  def out
    if @x < -10 or @x > 810
      return true
    end
  end

  def shoot
  	if rand < 0.002 and @y % 2.0 == 0.0000
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