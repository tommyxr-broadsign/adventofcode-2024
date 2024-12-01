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
	
	map(n -> n * count(==(n), b), a) |> sum
end

end

