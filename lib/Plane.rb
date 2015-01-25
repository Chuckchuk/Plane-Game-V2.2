  class Plane

 attr_reader :x, :y, :width, :height 

  def initialize(window)
    @x = 400
    @y = 990
    @width = 96
    @height = 60
    @image = Gosu::Image.new(window, "Resources/Plane.png", false)
    @shooting = false 
    @sp = 0
  end

    #def sp
    #if button_down?(Gosu::KbSpace) or button_down?(Gosu::KbE)
    #  @sp = 4
    #end
  #end

  def shoot
      @shooting = true
  end
  def notShoot
     @shooting = false
  end
    
  def speedP
    @sp = 2
  end
    

  def life
  
  end   

  def move_right
    if @shooting == false
	  @x = @x + 4 + @sp
	  if @x >= 760
	    @x = @x - 4 - @sp
	  end
	end
	if @shooting == true
	  @x = @x + 1 + @sp
	  if @x >= 760
	    @x = @x - 4 - @sp
	  end
	end
  end # def move_right

  def move_left
    if @shooting == false
	  @x = @x - 4 - @sp
	  if @x <= 40
	    @x = @x + 4 - @sp
	  end
	end #if shooting
	if @shooting == true
	  @x = @x - 1 - @sp
      if @x <= 40
	    @x = @x + 4 + @sp
      end
	end #if shooting	
  end #def move_left
  
  def move_up
    @y = @y - 2 - @sp
    if @y == 60
      @y = @y + 2 + @sp
    end
  end

  def move_down
    @y = @y + 2 + @sp
    if @y >= 990
      @y = @y - 2 - @sp
    end
  end



  def draw
    @image.draw(@x - @width/2, @y - @height/2, 1)
  end
end #Class Plane