class Square
	attr_reader :x, :y, :parent, :children

	def initialize(x, y, parent = nil)
		@x = x
		@y = y
		@parent = parent
		@children = []
	end

	def create_children
		possible_moves = []
		possible_moves.push(
			[@x + 1, @y + 2],
			[@x + 1, @y - 2],
			[@x + 2, @y + 1],
			[@x + 2, @y - 1],
			[@x - 1, @y + 2],
			[@x - 1, @y - 2],
			[@x - 2, @y + 1],
			[@x - 2, @y - 1]
		)
		
		valid_children = possible_moves.select { |move| move[0].between?(0,8) && move[1].between?(0,8) }
		valid_children.map! { |child_coords| Square.new(child_coords[0], child_coords[1], self) }			# changes from array of coordinates into an array of square (node) objects 
		@children = valid_children
	end
end