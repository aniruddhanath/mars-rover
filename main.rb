require File.dirname(__FILE__) + '/classes/input'
require File.dirname(__FILE__) + '/classes/rover'
require File.dirname(__FILE__) + '/classes/error'
require File.dirname(__FILE__) + '/classes/utils'

include Utils

# reading first line for grid limits
$grid = Utils.grid($stdin.readline)

while !$stdin.eof?
  input = Input.new
  input.position($stdin.readline)
  input.path($stdin.readline)
  begin
    r = Rover.new(input.rover, $grid)
  rescue GridLimitExceeded => e
    puts e.message
  else
    puts r.get_position
  end
end

