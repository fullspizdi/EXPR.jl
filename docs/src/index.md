# Welcome to EXPR.jl Documentation

Welcome to the official documentation for EXPR.jl, a powerful Julia package designed for metaprogramming. This package provides tools to analyze, modify, and generate Julia code dynamically, enabling advanced macro creation, language extension, and custom domain-specific languages (DSLs) within Julia.

## Getting Started

To get started with EXPR.jl, you will need to install the package using Julia's package manager. You can install EXPR.jl by running the following command in your Julia REPL:

```julia
using Pkg
Pkg.add("EXPR")
```

Once installed, you can start using EXPR.jl by including it in your Julia scripts with `using EXPR`.

## Features Overview

EXPR.jl offers a range of features divided into several modules, each tailored to different aspects of metaprogramming:

- **Introspection:** Tools to inspect Julia code objects and their properties.
- **Transformation:** Functions to programmatically modify and construct Julia expressions.
- **Syntax Helpers:** Utilities that aid in the creation and manipulation of macros and quoted expressions.

Each of these features is designed to give you more control over Julia's powerful metaprogramming capabilities.

## Documentation Structure

This documentation is structured to help you easily find information about specific features and functionalities of EXPR.jl:

- **[Introspection](introspection.md):** Learn how to inspect and analyze Julia expressions.
- **[Transformation](transformation.md):** Discover how to modify and create expressions dynamically.
- **[Syntax Helpers](syntax_helpers.md):** Explore utilities that simplify working with macros and quotes.

## Examples

Here is a simple example to give you a taste of what EXPR.jl can do:

```julia
using EXPR

# Create a function that adds a specified number to its input
add_5 = make_adder(5)
println(add_5(10))  # Output: 15
```

This example demonstrates how to create a function dynamically that adds a given number to its input.

## Contributing

Contributions to EXPR.jl are welcome. Whether it's improving the documentation, adding new features, or reporting bugs, your help is appreciated to make this tool more powerful and accessible.

## License

EXPR.jl is provided under a standard MIT license that allows you to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software.

Thank you for using EXPR.jl. We hope it empowers your Julia programming and opens up new possibilities in your projects!
