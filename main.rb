require File.dirname(__FILE__) + '/input'
require File.dirname(__FILE__) + '/rover'
require File.dirname(__FILE__) + '/error'

print "Enter the input! After you're done, type `END` "
$/ = "END"  
user_input = STDIN.gets

# file_name = gets.chomp

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
