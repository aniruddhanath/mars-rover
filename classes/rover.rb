class Rover
  attr_reader :position

  def initialize(rover, grid)
    @grid = grid
    @position = rover[:position]
    start_walking(rover[:path])
  end

  private
  def move_ahead(direction)
    case direction
    when "N" then @position[:y] += 1
    when "S" then @position[:y] += -1
    when "E" then @position[:x] += 1
    when "W" then @position[:x] += -1
    else # raise error
    end

    # limit exceed error
    raise GridLimitExceeded, "Grid's x-limit exceed" if @position[:x] > @grid[:x] || @position[:x] < 0
    raise GridLimitExceeded, "Grid's y-limit exceed" if @position[:y] > @grid[:y] || @position[:y] < 0
  end

  def turn_left(direction)
    case direction
    when "N" then @position[:d] = "W"
    when "S" then @position[:d] = "E"
    when "E" then @position[:d] = "N"
    when "W" then @position[:d] = "S"
    else # raise error
    end
  end

  def turn_right(direction)
    case direction
    when "N" then @position[:d] = "E"
    when "S" then @position[:d] = "W"
    when "E" then @position[:d] = "S"
    when "W" then @position[:d] = "N"
    else # raise error
    end
  end

  def start_walking(rover_path)
    rover_path.each do |path|
      direction = @position[:d]
      case path
      when "M" then move_ahead(direction)
      when "L" then turn_left(direction)
      when "R" then turn_right(direction)
      else # raise error
      end
    end
  end

  public
  def get_position
    "#{@position[:x].to_s} #{@position[:y].to_s} #{@position[:d]}"
  end
end
