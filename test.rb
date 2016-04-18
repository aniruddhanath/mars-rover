require 'test/unit'
require File.dirname(__FILE__) + '/input'
require File.dirname(__FILE__) + '/rover'
require File.dirname(__FILE__) + '/error'

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


class TestInput < Test::Unit::TestCase
  def test_input
    input = Input.new("test.txt")
    assert_equal input.grid, { x: 0, y: 0 }
    assert_equal input.positions, [{ x: 0, y: 2, d: "N" }, { x: 0, y: 1, d: "S" }]
    assert_equal input.paths, [ [ "L", "M", "L", "M", "L", "M", "L", "M", "M" ], [ "M", "M", "L", "M", "L", "M", "R", "M", "M" ]]
  end
end
