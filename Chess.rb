require_relative 'Square'

class Chess	
	def find_destination(start, destination)		# start is starting square object; destination is the final square object. 
		queue = []
		root = Square.new(start[0], start[1])
		return root if (root.x == destination[0]) && (root.y == destination[1])
		
		loop do
			root.create_children.each { |child| queue << child }
			root = queue.shift
			return root if (root.x == destination[0]) && (root.y == destination[1])
			break if queue.empty?
		end
		nil
	end
	
	def display_path(destination)
		array = []
		parent = destination
		loop do
			array << [parent.x, parent.y]
			parent = parent.parent
			break if parent == nil
		end
		array.reverse!
		puts "You made it in #{array.length} moves! Your path is:"
		p array
	end

	def move_knight(start, destination)
		display_path(find_destination(start, destination))
	end
end

chess = Chess.new
chess.move_knight([3,3],[4,3])