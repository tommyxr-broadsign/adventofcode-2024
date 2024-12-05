module Day04


readinput(i::String) = hcat(collect.(readlines(i))...)

function isxmas(data, ix::CartesianIndex, step::CartesianIndex)
    try
        return data[ix] == 'X' && data[ix + step] == 'M' && data[ix + 2step] == 'A' && data[ix + 3step] == 'S'
    catch
        return false
    end
end

function part1(input::String)
    data = readinput(input)
    
    sum(CartesianIndices(data)) do ix
        count(
            isxmas(data, ix, step) 
                for step in map(CartesianIndex, [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, -1), (1, -1), (-1, 1)]))
    end
end

function ismas(data, ix::CartesianIndex, step::CartesianIndex)
    try
        return data[ix] == 'A' && ((data[ix - step] == 'M' && data[ix + step] == 'S') || (data[ix - step] == 'S' && data[ix + step] == 'M'))
    catch
        return false
    end
end

function part2(input::String)
    data = readinput(input)
    
    sum(CartesianIndices(data)) do ix
        ismas(data, ix, CartesianIndex(1, 1)) && ismas(data, ix, CartesianIndex(1, -1))
     end
end


end
