using Term

function is_pandigital(n)
    Set(string(n)) == Set(string(123456789))
end
function is_pandigital(n::Set)
    n == Set(string(123456789))
end

function main()
    a = BigInt(1)
    b = BigInt(1)
    count = 2
    while true
        count += 1
        a, b = b, a + b
        if is_pandigital(b % 10^9)
            if is_pandigital(Set(string(b)[1:9]))
                return count
                break
            end
        end
    end
end

println(@style main() red bold)
@time main()