module EXPR

# This submodule provides syntax helper utilities for Julia expressions.

export wrap_in_quote, create_macro, simplify_quote

"""
    wrap_in_quote(expr::Expr)

Wrap a given expression in a quote block.

# Arguments
- `expr::Expr`: The expression to wrap.

# Returns
- `Expr`: The quoted expression.

# Examples
```julia
wrap_in_quote(:(x + y))
```
"""
function wrap_in_quote(expr::Expr)
    return Expr(:quote, expr)
end

"""
    create_macro(name::Symbol, expr::Expr)

Create a macro with the given name and expression.

# Arguments
- `name::Symbol`: The name of the macro.
- `expr::Expr`: The expression that defines the macro's functionality.

# Returns
- `Expr`: The macro definition.

# Examples
```julia
create_macro(:my_macro, :(x -> x + 1))
```
"""
function create_macro(name::Symbol, expr::Expr)
    macro_expr = Expr(:macro, Expr(:call, name), expr)
    eval(macro_expr)
    return macro_expr
end

"""
    simplify_quote(expr::Expr)

Simplify nested quote expressions into a single quote block.

# Arguments
- `expr::Expr`: The expression to simplify.

# Returns
- `Expr`: The simplified quote expression.

# Examples
```julia
simplify_quote(quote quote x + y end end)
```
"""
function simplify_quote(expr::Expr)
    if expr.head == :quote
        inner_expr = expr.args[1]
        if typeof(inner_expr) == Expr && inner_expr.head == :quote
            return simplify_quote(inner_expr)
        end
    end
    return expr
end

end # module EXPR
