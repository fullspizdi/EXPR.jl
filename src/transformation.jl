module EXPR

# This submodule provides transformation utilities for Julia expressions.

export transform_expr, create_function, modify_function_body

"""
    transform_expr(expr::Expr, transform_func::Function)

Transform a given expression using a specified transformation function.

# Arguments
- `expr::Expr`: The expression to transform.
- `transform_func::Function`: The function that defines how the expression should be transformed.

# Returns
- `Expr`: The transformed expression.

# Examples
```julia
transform_expr(:(x -> x + 1), e -> Base.replace_expr(e, :(x), :(y)))
```
"""
function transform_expr(expr::Expr, transform_func::Function)
    return transform_func(expr)
end

"""
    create_function(args::Expr, body::Expr)

Create a new function expression from given arguments and body.

# Arguments
- `args::Expr`: The arguments of the function.
- `body::Expr`: The body of the function.

# Returns
- `Expr`: A new function expression.

# Examples
```julia
create_function(:(x, y), :(x + y))
```
"""
function create_function(args::Expr, body::Expr)
    return Expr(:function, Expr(:call, args), body)
end

"""
    modify_function_body(func_expr::Expr, new_body::Expr)

Modify the body of a given function expression.

# Arguments
- `func_expr::Expr`: The function expression to modify.
- `new_body::Expr`: The new body for the function.

# Returns
- `Expr`: The modified function expression.

# Examples
```julia
modify_function_body(:(function f(x) x + 1 end), :(x * 2))
```
"""
function modify_function_body(func_expr::Expr, new_body::Expr)
    if func_expr.head == :function && length(func_expr.args) == 2
        func_expr.args[2] = new_body
    end
    return func_expr
end

end # module EXPR
