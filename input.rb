class Input
  attr_reader :grid
  attr_reader :positions
  attr_reader :paths

  def initialize(file_name)
    @grid = Hash.new([])
    @positions = []
    @paths = []
    read_line(file_name)
  end

  private
  def file_sandwich(file_name)
    begin
      file = open(file_name)
    rescue
      puts "No such file found"
    else
      yield(file)
    end
  ensure
    file.close if file
  end

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

  def read_line(file_name)
    file_sandwich(file_name) do |file|
      grid_limits = file.gets.split(" ")
      @grid[:x] = grid_limits[0].to_i
      @grid[:y] = grid_limits[1].to_i

      i = 0
      while line = file.gets
        if i % 2 == 0 # it's denoting the position
          store_position(line)
        else # path of the rover
          store_path(line)
        end
        i += 1
      end
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
