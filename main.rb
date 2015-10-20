require 'bundler'
Bundler.setup(:default)

require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Raumschiffding"

    @background_image = Gosu::Image.new("space.png", :tileable => true)
    
    @player = Player.new
    @player.warp(320, 400)
  end

  def update
    if Gosu::button_down? Gosu::KbLeft then
      @player.move_left
    end
    if Gosu::button_down? Gosu::KbRight then
      @player.move_right
    end
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

class Player
  def initialize
    @image = Gosu::Image.new("raumschiff.png")
    @x = @y = @vel_x = @vel_y = 0.0
    @angle = -90.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move_right
  	if @x < 640 - @image.width/2
  	  @x += 2
    end
  end

  def move_left
  	if @x > 0 + @image.width/2
  	  @x -= 2
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end

window = GameWindow.new
window.show
