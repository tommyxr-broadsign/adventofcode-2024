module Day01


readInput(filename::String) = eachline(filename) |> collect .|> split .|> (x -> parse.(Int, x))

function part1(input::String)
	data = readInput(input)
	
	a = first.(data); sort!(a)
	b = last.(data); sort!(b)

	abs.(a .- b) |> sum
end

function part2(input::String)
	data = readInput(input)
	
	a = first.(data)
	b = last.(data)
	
	occurences = Dict{Int, Int}()
	for n in b
		occurences[n] = get(occurences, n, 0) + 1
	end
	
	map(n -> n*get(occurences, n, 0), a) |> sum
end

end

