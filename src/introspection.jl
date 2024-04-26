module EXPR

# This submodule provides introspection utilities for Julia expressions.

export inspect_expr, get_expr_type, list_expr_args

"""
    inspect_expr(expr::Expr)

Inspect a given expression, returning a detailed breakdown of its components.

# Arguments
- `expr::Expr`: The expression to inspect.

# Returns
- `Dict{String, Any}`: A dictionary containing the type, arguments, and other relevant details of the expression.

# Examples
```julia
inspect_expr(:(x -> x + 1))
```
"""
function inspect_expr(expr::Expr)
    return Dict(
        "head" => expr.head,
        "args" => expr.args,
        "typ" => typeof(expr)
    )
end

"""
    get_expr_type(expr::Expr)

Retrieve the type of a given expression.

# Arguments
- `expr::Expr`: The expression whose type is to be determined.

# Returns
- `DataType`: The type of the expression.

# Examples
```julia
get_expr_type(:(x -> x + 1))
```
"""
function get_expr_type(expr::Expr)
    return typeof(expr)
end

"""
    list_expr_args(expr::Expr)

List the arguments of a given expression.

# Arguments
- `expr::Expr`: The expression whose arguments are to be listed.

# Returns
- `Array`: An array of the arguments in the expression.

# Examples
```julia
list_expr_args(:(x -> x + 1))
```
"""
function list_expr_args(expr::Expr)
    return expr.args
end

end # module EXPR
