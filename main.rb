require File.dirname(__FILE__) + '/input'
require File.dirname(__FILE__) + '/rover'
require File.dirname(__FILE__) + '/error'
 
user_input = ARGF.read

input = Input.new(user_input)
grid = input.grid

begin
  rovers = input.rovers
rescue RuntimeError => e
  abort(e.message)
end

rovers.each do |rover|
  begin
    r = Rover.new(rover, grid)
  rescue GridLimitExceeded => e
    puts e.message
  else
    puts r.get_position
  end
end
