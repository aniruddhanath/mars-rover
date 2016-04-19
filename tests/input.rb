require File.expand_path("../../classes/input.rb", __FILE__)

class TestInput < Test::Unit::TestCase
  $input = Input.new

  def test_input_position
    position = $input.position("0 2 N")
    assert_equal position, { x: 0, y: 2, d: "N" }
  end

  def test_input_path
    path = $input.path("LMLMLMLMM")
    assert_equal path, [ "L", "M", "L", "M", "L", "M", "L", "M", "M" ]
  end

  def test_input_rover
    rover = $input.rover
    assert_equal rover, { path: [ "L", "M", "L", "M", "L", "M", "L", "M", "M" ], position: { x: 0, y: 2, d: "N" } }
  end
end
