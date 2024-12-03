module Day02

parseInput(input::String) = readlines(input) .|> split .|> (x -> parse.(Int, x))

pairwise(x) = zip(x, last(Iterators.peel(x)))

issafedistance(a, b) = 0 < abs(a  - b) <= 3

function part1(input::String)
	data = parseInput(input)
	
	count(data) do levels
		ascending = levels[1] < levels[2]
		
		if ascending
			return all(pairwise(levels)) do (level1, level2)
				(level2 > level1)  && issafedistance(level1, level2) 
			end
		else
			return all(pairwise(levels)) do (level1, level2)
				(level2 < level1) && issafedistance(level1, level2) 
			end
		end
	end
end

function isvalid(levels)
		ascending = begin
			nasc = count(pairwise(levels)) do (l1, l2)
				l1 < l2
			end
			
			2nasc > length(levels) 
		end
		
		if ascending
			return all(pairwise(levels)) do (level1, level2)
				(level2 > level1)  && issafedistance(level1, level2) 
			end
		else
			return all(pairwise(levels)) do (level1, level2)
				(level2 < level1) && issafedistance(level1, level2) 
			end
		end
end
			
function part2(input::String)
	data = parseInput(input)

	count(data) do levels
		
		if isvalid(levels)
			return true
		end
		
		for i in 1:length(levels)
			levels_edited = copy(levels)
			deleteat!(levels_edited, i)
			if isvalid(levels_edited)
				@info "WOrks with removing i = $i"
				return true
			end
		end
		return false
	end
end

end

