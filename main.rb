require File.dirname(__FILE__) + '/input'
require File.dirname(__FILE__) + '/rover'
require File.dirname(__FILE__) + '/error'

print "Give away a file name where the input is! "
file_name = gets.chomp

input = Input.new(file_name)
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
