require File.expand_path("../../classes/rover.rb", __FILE__)
require File.expand_path("../../classes/error.rb", __FILE__)

class TestRover < Test::Unit::TestCase
  def test_rover
    grid = { x: 5, y: 5 }
    rover = {
      position: { x: 1, y: 2, d: "N" },
      path: [ "L", "M", "L", "M", "L", "M", "L", "M", "M" ]
    }

    position = Rover.new(rover, grid).position;
    assert_equal position, { x: 1, y: 3, d: "N" }
  end

  def test_rover_single_step
    grid = { x: 2, y: 2 }
    rover = {
      position: { x: 0, y: 0, d: "N" },
      path: [ "L" ]
    }

    position = Rover.new(rover, grid).position;
    assert_equal position, { x: 0, y: 0, d: "W" }
  end

  def test_rover_get_position
    grid = { x: 5, y: 5 }
    rover = {
      position: { x: 1, y: 2, d: "N" },
      path: [ "L", "M", "L", "M", "L", "M", "L", "M", "M" ]
    }

    position = Rover.new(rover, grid).get_position;
    assert_equal position, "1 3 N"
  end

  def test_rover_negative_x
    grid = { x: 5, y: 0 }
    rover = {
      position: { x: 1, y: 2, d: "N" },
      path: [ "L", "M", "L", "M", "L", "M", "L", "M", "M" ]
    }
    assert_raise(GridLimitExceeded) { 
      Rover.new(rover, grid)
    }
  end

end
