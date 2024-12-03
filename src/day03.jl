module Day03

readinput(input::String) = readlines(input) |> join

function part1(input::String)
    data = readinput(input)
    
    sum(eachmatch(r"mul\((\d+),(\d+)\)", data)) do m
        *(parse.(Int, m.captures)...)
    end
end

function part2(input::String)
    data = readinput(input)
    data = eachmatch(r"(^|(do\(\))).*?don't\(\)", data) .|> (x -> x.match) |> join
    
    sum(eachmatch(r"mul\((\d+),(\d+)\)", data)) do m
        *(parse.(Int, m.captures)...)
    end
end

end
