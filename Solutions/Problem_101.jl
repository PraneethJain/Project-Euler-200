using Term

u(n) = 1 - n + n^2 - n^3 + n^4 - n^5 + n^6 - n^7 + n^8 - n^9 + n^10

function FIT(k)
    L = [[u(n) for n in 1:k]]
    for i in k:-1:2
        push!(L, [L[end][j] - L[end][j-1] for j in 2:i])
    end
    for j = k:-1:2
        push!(L[j-1], L[j-1][end] + L[j][end])
    end
    return L[1][end]
end

println(@style sum(FIT, 1:10) red bold)
@time sum(FIT, 1:10)
