using Term
using Combinatorics

function sum_check(A)
    subsets = powerset(A, 1)
    for B in subsets, C in subsets
        if isdisjoint(B, C)
            sumB = sum(B)
            sumC = sum(C)
            if sumB == sumC
                return 0
            end
            if length(B) > length(C) && sumB <= sumC
                return 0
            end
        end
    end
    return sum(A)
end

function main()
    open("./Files/p105_sets.txt") do f
        sets = readlines(f)
    end
    return sum([sum_check([parse(Int, ele) for ele in split(set, ',')]) for set in sets])
end

println(@style main() red bold)
@time main()