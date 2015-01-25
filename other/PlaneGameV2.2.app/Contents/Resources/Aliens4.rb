require 'gosu'
class Aliens4


 attr_reader :x, :y, :width, :height

  def initialize(window, x, y)
    @x = rand * 800
    @y = 0
    @width = 40
    @height = 60
    @image = Gosu::Image.new(window, "Resources/Alien4.png", false)
    @dt = 0
    @alife = 10
  	@vy = 3
    @angle = 0
      
      if @y <= 0 
       @speed = rand * 2
      end
      if @speed >= 1 
        @vy = 3
      elsif @speed < 1 
        @vy = 5
      end

  end


  def gethit
  	@dt = @dt + 2
  end

  def alife

    if @vy == 5
  	 if @dt == 0
  		@alife = 2
     elsif @dt == 2
 		  @alife = 0
 	   end
    end
    if @vy == 3
     if @dt == 0
      @alife = 4
     elsif @dt == 4
      @alife = 0
     end
    end

  	if @alife <= 0
  		return true
  	else
  		return false
  	end
  end
 
  def move

	@y = @y + @vy
   def moving
    if @x > 720
      @x = @x -3
    end
    if @x < 80
      @x = @x + 3
    end 
   end #moving

  def away
      @vy = -8
      @angle = -180

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