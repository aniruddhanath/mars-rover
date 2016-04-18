class Input
  attr_reader :grid
  attr_reader :positions
  attr_reader :paths

  def initialize(user_input)
    @grid = Hash.new([])
    @positions = []
    @paths = []
    parse_input(user_input)
  end

  private
  def store_position(line)
    rover_position = line.split(" ")
    position = {
      x: rover_position[0].to_i,
      y: rover_position[1].to_i,
      d: rover_position[2]
    }
    @positions.push(position)
  end

  def store_path(line)
    path = line.split("")
    if path[-1] == "\n"
      @paths.push(path[0...-1])
    else
      @paths.push(path)
    end
  end

  def parse_input(user_input)
    input_array = user_input.split("\n")
    input_array.shift # check for starting blank line

    # first line
    input = input_array.shift
    line_array = input.split("</br>")
    grid_limits = line_array[0].split(" ")
    @grid = { x: grid_limits[0].to_i, y: grid_limits[1].to_i }
    
    input_array.each_with_index do |input, index|
      next if (input == "END")
      line_array = input.split("</br>")
      line = line_array[0]
      index % 2 == 0 ? store_position(line) : store_path(line)
    end
  end

  public
  def rovers
    raise Exception, "Mismatch in number of positions and paths found" if @positions.size != @paths.size

    rovers = []
    @positions.each_with_index do |position, index|
      rover = {
        position: position,
        path: @paths[index]
      }
      rovers.push(rover)
    end
    rovers
  end
end
