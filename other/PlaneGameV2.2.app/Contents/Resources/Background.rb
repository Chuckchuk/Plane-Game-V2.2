class Background 

attr_reader :x, :y, :width, :height

	def initialize
		@x = 0
		@y = 0
		@width = 800
		@height = 1300
		@image = Gosu::Image.new(window, "Resources/Background.png", false)
	end

	def draw
		@image.draw(@x - @width/2, @y - @height/2, 1)
	end

end