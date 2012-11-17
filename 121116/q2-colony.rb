#!/usr/bin/env ruby

X, Y = STDIN.gets.chomp.split(/ /).map { |i| i.to_i }

@space = []

class Cell
  @@colony_id = 0
  attr_accessor :lived, :scaned, :colony_id
  def initialize(lived)
    @lived = lived
  end
  def lived?; @lived == 1; end
  def scaned?; @scaned; end
  def is_colony(colony_id = @@colony_id)
    @colony_id = colony_id
  end
  def is_new_colony
     @colony = @@colony_id += 1
  end
  def self.last_colony_id; @@colony_id; end
end

Y.times { @space << STDIN.gets.chomp.split(//).map { |i| Cell.new(i.to_i) } }

def search(y, x, colony_id = nil)
  cell = @space[y][x]
  return if (not cell.lived?) || cell.scaned?
  cell.scaned = true
  colony_id ||= cell.is_new_colony

  # right
  if x+1 < X && @space[y][x+1].lived?
    search(y, x+1, colony_id)
  end
  # below
  if y+1 < Y && @space[y+1][x].lived?
    search(y+1, x, colony_id)
  end
  # left
  if x > 0 && @space[y][x-1].lived?
    search(y, x-1, colony_id)
  end
  # above
  if y > 0 && @space[y-1][x].lived?
    search(y-1, x, colony_id)
  end
end

Y.times { |y| X.times { |x| search(y, x) } }

puts Cell.last_colony_id
