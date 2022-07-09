using Term

open("./Files/p102_triangles.txt") do f
    global triangles = readlines(f)
end

function area(x1, y1, x2, y2, x3, y3)
    area = 0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))
    return area > 0 ? area : -area
end

function result()
    count = 0
    for triangle in triangles
        x1, y1, x2, y2, x3, y3 = [parse(Int, str) for str in split(triangle, ',')]
        if (area(x1, y1, x2, y2, x3, y3) == area(0, 0, x2, y2, x3, y3) + area(x1, y1, 0, 0, x3, y3) + area(x1, y1, x2, y2, 0, 0))
            count += 1
        end
    end
    return count
end

print(@style result() red bold)
@time result()
