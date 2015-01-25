class Bombs

attr_reader :x, :y, :width, :height



	
	def initialize(window, x, y) 
		@x = x
		@y = y
		@width = 2
		@height = 10
		@image = Gosu::Image.new(window, 'Resources/Laser.png', false)
	end

	def move
		@y = y + 3
	end #move


	def draw
		@image.draw(@x, @y, 1)
	end

	def yValue 
		if @y == 1080
			return true
		else

		end
	
	end
end
#		@side = rand * 2

#		if @side <= 0.5 and @side >= 0
#			@x = x + 2
#		elsif @side >=0.5 and @side <= 1.5
#			@x = x
#		elsif @side >= 1.5 and @side <= 2
#			@x = x - 2
#		end