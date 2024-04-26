module EXPR

export make_adder

# Import necessary Julia core functionalities
using Base: @__MODULE__, @__FILE__

# Include submodules
include("introspection.jl")
include("transformation.jl")
include("syntax_helpers.jl")

"""
    make_adder(n::Int)

Create a function that adds `n` to its input.

# Examples
```julia
add_5 = make_adder(5)
println(add_5(10))  # Output: 15
```
"""
function make_adder(n)
    eval(quote
        x -> x + $n
    end)
end

end # module EXPR
