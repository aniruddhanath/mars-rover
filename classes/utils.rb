module Utils
  def grid(line)
    grid_limits = line.split(" ")
    { x: grid_limits[0].to_i, y: grid_limits[1].to_i }
  end
end
