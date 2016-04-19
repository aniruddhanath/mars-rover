class Input
  attr_reader :position
  attr_reader :path

  def initialize
    @position = {}
    @path = []
  end

  public

  public
  def position(line)
    rover_position = line.split(" ")
    @position = {
      x: rover_position[0].to_i,
      y: rover_position[1].to_i,
      d: rover_position[2]
    }
  end

  def path(line)
    @path = line.split("")
    @path[-1] == "\n" ? @path[0...-1] : @path
  end

  def rover
    { position: @position, path: @path }
  end
end
