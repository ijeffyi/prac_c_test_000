"""
    inclusion_exclusion(P)

Return ℙ(∪ᵢAᵢ) where the `i`th entry in `P` stores ℙ(Aᵢ).

Assumes that A₁, A₂, …, Aₙ are mutually independent events.
"""
function inclusion_exclusion(P::Vector{Float64})
    @assert length(P) != 0

    if length(P) == 1
        return P[1]
    end

    m = length(P) ÷ 2
    first_half = P[1:m]
    second_half = P[m+1:end]

    p = inclusion_exclusion(first_half)
    q = inclusion_exclusion(second_half)
    return p + q - p * q
end

inclusion_exclusion([0.1, 0.25, 0.5])

