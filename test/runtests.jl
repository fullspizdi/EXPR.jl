using Test
using EXPR

@testset "EXPR.jl Tests" begin

    @testset "Introspection Tests" begin
        expr = :(x -> x + 1)
        inspected = inspect_expr(expr)
        @test inspected["head"] == :-> 
        @test length(inspected["args"]) == 2
        @test get_expr_type(expr) == Expr
        @test list_expr_args(expr) == [:(x), :(x + 1)]
    end

    @testset "Transformation Tests" begin
        expr = :(x -> x + 1)
        transformed = transform_expr(expr, e -> Base.replace_expr(e, :(x), :(y)))
        @test transformed == :(y -> y + 1)

        func_expr = create_function(:(x, y), :(x + y))
        @test typeof(func_expr) == Expr
        @test func_expr.args[1] == Expr(:call, :(x, y))
        @test func_expr.args[2] == :(x + y)

        modified_func = modify_function_body(func_expr, :(x * y))
        @test modified_func.args[2] == :(x * y)
    end

    @testset "Syntax Helpers Tests" begin
        expr = :(x + y)
        quoted = wrap_in_quote(expr)
        @test quoted == quote x + y end

        macro_def = create_macro(:test_macro, :(x -> x + 1))
        @test macro_def == Expr(:macro, Expr(:call, :test_macro), :(x -> x + 1))

        nested_quote = quote quote x + y end end
        simplified = simplify_quote(nested_quote)
        @test simplified == quote x + y end
    end

    @testset "make_adder Functionality" begin
        add_5 = make_adder(5)
        @test add_5(10) == 15
        add_10 = make_adder(10)
        @test add_10(5) == 15
    end

end
