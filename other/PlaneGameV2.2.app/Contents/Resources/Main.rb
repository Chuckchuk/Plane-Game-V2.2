 require 'gosu'
require_relative 'plane'
require_relative 'bullets'
require_relative 'aliens'
require_relative 'aliens2'
require_relative 'lazers'
require_relative 'aliens2v2'
require_relative 'aliens3'
require_relative 'bombs'
require_relative 'aliens4'

 #while @play
class PlaneGame < Gosu::Window



  def initialize        #****************************************#
    super(800, 1080, false)
    self.caption = "Plane Game V2.2"
    @plane = Plane.new(self)
    @bullets = []
    @aliens = []
	  @aliens2 = []
	  @lazers = []
    @aliens3 = []
    @aliens4 = [] 
    @lives = 100
  # @aLife = 10
    @hull = 100
    @score = 0
    @dp = 0
    @alien_count = @alien2_count = @alien3_count = @alien4_count = 0
    @bullets_fired = 0
  	@font = Gosu::Font.new(self, "System", 36)
    @font2 = Gosu::Font.new(self, "System", 80)
    @times_played = 0
    @replay = true


    @option_press = true

    @start_time = (Time.now).to_i
    @every_n_seconds = 1
    @last_recorded_seconds = 0
	
	@game_over = false

	@background = Gosu::Image.new(self, "Resources/Background.png", false)
	
 
	
  end #def initialize

  def draw              #****************************************#
    @plane.draw
    @bullets.each do |bullet|
      bullet.draw
    end
    @lazers.each do |lazer|
    	lazer.draw
    end
    @aliens.each do |alien|
        alien.draw
    end
	 @aliens2.each do |alien2|
	 	alien2.draw
   end
   @aliens3.each do |alien3|
    alien3.draw
   end
   @aliens4.each do |alien4|
    alien4.draw
   end
   if @game_over == true
      @font2.draw("Game Over", 210, 540, 1)
      @font.draw("Bullets Fired: #{@bullets_fired}", 265, 630, 1)
      @font.draw("Score: #{@score}", 361, 660, 1)
      if @alien_count > 0
        @font.draw("Red Alien: #{@alien_count}", 304, 690, 1)
      end
      if @alien2_count > 0
        @font.draw("Blue Alien: #{@alien2_count}", 299, 720, 1)
      end
      if @alien3_count > 0
        @font.draw("Gold Alien: #{@alien3_count}", 295, 750, 1)
      end
      if @alien4_count > 0
        @font.draw("Green Alien: #{@alien4_count}", 274, 780, 1) 
      end           
   end 


  @font.draw("Hull Integrity: #{@hull}%", 35, 1040, 0)
  @font.draw("Planet Life: #{@lives}", 550, 1040, 0)
#  @font.draw("Planet Life: #{@bullets_fired}", 580, 1050, 0)
  @font.draw("Score", 361, 1020, 0)
	if @score < 10 and @score >=0 
		@font.draw("#{@score}", 398, 1050, 0)
	end	
	if @score < 100 and @score >=10 
		@font.draw("#{@score}", 389, 1050, 0)
	end	
	if @score < 1000 and @score >=100 
		@font.draw("#{@score}", 378, 1050, 0)
	end	
	if @score < 10000 and @score >=1000 
		@font.draw("#{@score}", 367, 1050, 0)
	end		
	if @score < 100000 and @score >10000 
		@font.draw("#{@score}", 356, 1050, 0)
	end			

	@z = @score / 3.500 - 1520.000

	@background.draw(0, @z, -1)										

  end #def draw


  def touching?(obj1, obj2)
    if (obj1.x - obj2.x).abs < (obj1.width + obj2.width)/2 and (obj1.y - obj2.y).abs < (obj1.height + obj2.height)/2
        return true
    else
        return false
    end
  end # define







  def update            #****************************************#
  #def sp 

#while @replay

   if @game_over == true
     @option_press = false
    #  if button_down?(Gosu::KbEnter)
    #    @replay = true
    #  end  


   else


   # @life_lost = @plane.move
    
     @aliens.each do |alien|
       if alien.yvalue == true
         @lives = @lives - 5
		 @aliens.delete alien
       end
     end
     @aliens2.each do |alien2|
       if alien2.yvalue == true
         @lives = @lives - 6
		 @aliens2.delete alien2
       end
     end
     @aliens3.each do |alien3|
       if alien3.yvalue == true
         @lives = @lives - 20
     @aliens3.delete alien3
       end
     end
     @aliens4.each do |alien4|
       if alien4.yvalue == true
         @lives = @lives - 8
     @aliens4.delete alien4
       end
     end


	@aliens2.each do |alien2|
		if touching?(@plane, alien2)
			@hull = @hull - 10
			@aliens2.delete alien2
		end
	end
	@aliens.each do |alien|
		if touching?(@plane, alien)
			@hull = @hull - 5
			@aliens.delete alien
		end
	end

	@lazers.each do |lazer|
		if touching?(@plane, lazer)
			@hull = @hull - 2
			@lazers.delete lazer
		end
	end
    @aliens3.each do |alien3|
    if touching?(@plane, alien3)
      @hull = @hull - 15
      @aliens3.delete alien3
    end
  end
    @aliens4.each do |alien4|
    if touching?(@plane, alien4)
      @hull = @hull - 10
      @aliens4.delete alien4
    end
  end

     
       if @lives <= 0 or @hull <= 0
          @game_over = true


       end



    @bullets.each do |bullet|
      bullet.move
    end
    @lazers.each do |lazer|
      lazer.move
    end


    @aliens.each do |alien|
      alien.move
    end
    @aliens2.each do |alien2|
      alien2.move
    end
    @aliens3.each do |alien3|
      alien3.move
    end
    @aliens4.each do |alien4|
      alien4.move
    end

#  if @score < 500 or @score >= 600
    @aliens.each do |alien|
    	alien.moving
    end
    @aliens2.each do |alien2|
    	alien2.moving
    end
    @aliens3.each do |alien3|
      alien3.moving
    end
    @aliens4.each do |alien4|
      alien4.moving
    end
#  end


    if rand < 0.012 and @score < 20
       @aliens.push Alien.new(self, @x, @y)
    end 
    if rand < 0.014 and @score >= 20 and @score < 100
    	@aliens.push Alien.new(self, @x, @y)
    end 
 #   if rand < 0.02 and @score >= 60 and @score < 100
 #   	@aliens.push Alien.new(self, @x, @y)
 #   end
    if rand < 0.014 and @score >= 100 and @alien3_count < 1
    # NOT THIS ONE @aliens.push Alien.new(self, @x, @y)
    end
    if rand < 0.013 and @alien3_count >= 1 and @score < 250
      @aliens.push Alien.new(self, @x, @y)
    end
    if rand < 0.024 and @score >= 250 and @score < 500
    	@aliens.push Alien.new(self, @x, @y)
    end
    if rand < 0.032 and @score >= 500 and @score < 750
      @aliens.push Alien.new(self, @x, @y)
    end  
    if rand < 0.039 and @score >= 750 and @score < 1000
      @aliens.push Alien.new(self, @x, @y)
    end  
    if rand < 0.045 and @score >= 1000 and @score < 1800
      @aliens.push Alien.new(self, @x, @y)
    end  
    if rand < 0.058 and @score >= 1800
      @aliens.push Alien.new(self, @x, @y)
    end  


    if rand < 0.003 and @score >= 10 and @score < 100 
       @aliens2.push Alien2.new(self, @x, @y)
    end  
    if rand < 0.003 and @score >= 100 and @alien3_count < 1
  #NOT THIS ONE @aliens2.push Alien2.new(self, @x, @y)
    end 
    if rand < 0.0045 and @alien3_count >= 1 and @score < 400 
       @aliens2.push Alien2.new(self, @x, @y)
    end
    if rand < 0.0054 and @score >= 400 and @score < 800
       @aliens2.push Alien2.new(self, @x, @y)
    end
    if rand < 0.008 and @score >= 900 and @score < 1100
       @aliens2.push Alien2.new(self, @x, @y)
    end  
    if rand < 0.01 and @score >= 1100 and @score < 1400
       @aliens2.push Alien2.new(self, @x, @y)
    end    
    if rand < 0.016 and @score >= 1400
       @aliens2.push Alien2.new(self, @x, @y)
    end          


    if @aliens3.count == 0 and @aliens2.count == 0 and @aliens.count == 0 and rand < 0.5 and @score >= 100 and @alien3_count < 1
       @aliens3.push Aliens3.new(self, @x, @y)
    end
    if rand < 0.0006 and @alien3_count >= 1 and @score < 500
        @aliens3.push Aliens3.new(self, @x, @y)
    end
    if rand < 0.0012 and @score >= 500 and @score < 1200
        @aliens3.push Aliens3.new(self, @x, @y)
    end
    if rand < 0.0017 and @score >= 1200
        @aliens3.push Aliens3.new(self, @x, @y)
    end


    if rand < 0.003 and @score >= 500 and @score < 800
        @aliens4.push Aliens4.new(self, @x, @y)
    end
   # if rand < 0.0035 and @score >= 600 and @score < 1000
   #     @aliens4.push Aliens4.new(self, @x, @y)
   # end
    if rand < 0.0035 and @score >= 800 and @score < 1000
        @aliens4.push Aliens4.new(self, @x, @y)
    end
    if rand < 0.0043 and @score >= 1000
        @aliens4.push Aliens4.new(self, @x, @y)
    end


  #  if @score >= 500 and @score <= 600
  #    @aliens.each do |alien|
  #      alien.away
  #    end
  #    @aliens2.each do |alien2|
  #      alien2.away
  #    end
  #    @aliens3.each do |alien3|
  #      alien3.away
  #    end
  #    @aliens4.each do |alien4|
  #      alien4.away
  #    end
  #  end

    @aliens.each do |alien|
      if alien.out == true
        @aliens.delete alien
      end
    end
    @aliens2.each do |alien2|
      if alien2.out == true
        @aliens2.delete alien2
      end
    end
    @aliens3.each do |alien3|
      if alien3.out == true
        @aliens3.delete alien3
      end
    end
    @aliens4.each do |alien4|
      if alien4.out == true
        @aliens4.delete alien4
      end
    end



	    @bullets.each do |bullet|
	     @aliens.each do |alien|
          if touching?(alien, bullet)
            @bullets.delete bullet
              @alien_count += 1            
            @score = @score + 1
            @aliens.delete alien
          end
        end
      end

      @bullets.each do |bullet|
        @aliens2.each do |alien2|
          if touching?(alien2, bullet)
            alien2.gethit
            @bullets.delete bullet
            if alien2.alife == true
              @aliens2.delete alien2
              @alien2_count += 1              
              @score = @score + 3
            end
          end
        end
      end
      @bullets.each do |bullet|
        @aliens3.each do |alien3|
          if touching?(alien3, bullet)
            alien3.gethit
            @bullets.delete bullet
            if alien3.alife == true
              @aliens3.delete alien3
              @alien3_count += 1
              @score = @score + 5
            end
          end
        end
      end
      @bullets.each do |bullet|
        @aliens4.each do |alien4|
          if touching?(alien4, bullet)
            alien4.gethit
            @bullets.delete bullet
            if alien4.alife == true
              @aliens4.delete alien4
              @alien4_count += 1
              @score = @score + 3
            end
          end
        end
      end
 #   if @score < 500 or @score >= 600
      @aliens2.each do |alien2|
      		if alien2.shoot == true
      			@lazers.push Lazers.new(self, alien2.x, alien2.y)
      		end
      end
      @aliens3.each do |alien3|
         #BOMB
      end
#    end

                         # *********************Touching Left and Right************************* #

#      @aliens.each do |alien| 
#        if touchingL?(alien, alien)
#          alien.left_x
#        end
#      end
#      @aliens.each do |alien|
#        if touchingR?(alien, alien)
#          alien.right_x
#        end
#      end


      @bullets.each do |bullet|
        if bullet.yValue == true
          @bullets.delete bullet
        end
      end

       
  

    if button_down?(Gosu::KbSpace) or button_down?(Gosu::KbE)
      @plane.shoot
    else
      @plane.notShoot
    end

  #end

    

    if button_down?(Gosu::KbRight) or button_down?(Gosu::KbD)
      @plane.move_right
    end
    
    if button_down?(Gosu::KbLeft) or button_down?(Gosu::KbA)
      @plane.move_left
    end

    if button_down?(Gosu::KbUp) or button_down?(Gosu::KbW)
      @plane.move_up
    end

    if button_down?(Gosu::KbDown) or button_down?(Gosu::KbS)
      @plane.move_down
    end


    def seconds
      (Time.now-@start_time).to_i 
    end
   

#    def add_bullets?
#        if seconds != @last_recorded_seconds and seconds % 0.5 == 0 #@every_n_seconds == 0
#          @last_recorded_seconds = seconds
#          return true
#        else
#          return false
#        end
#    end

#    def button_up(id)
#      if id == Gosu::KbP
#        @pause = false
#      end
#    end  

    def button_down(id) 
     if @option_press == true
      if id == Gosu::KbSpace
        @bullets.push Bullet.new(self, @plane.x - 5, @plane.y - 40)
        @bullets_fired += 1
      end
     end
    end
  #  def button_up(id)
  #    if id == Gosu::KbEsc
  #      
  #    else
  #      close
  #    end
  #f  end
   #   t = Time.now
  #    if button_down?(Gosu::KbSpace) and add_bullets? #t.to_i % 5 == 1.5000 
  #      @bullets.push Bullet.new(self, @plane.x - 5, @plane.y - 40) 
  #      @bullets_fired += 1
  #    end #if id
  #  end #def button_down

  end #game_over
  end #Def update
#end #while
end #Class PlaneGame
window = PlaneGame.new
window.show