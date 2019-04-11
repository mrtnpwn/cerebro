# cerebro

A tiny Brainfuck dialect in pure Lua.

The main feature is that it has functions:

```bf
The function declaration starts with a parenthesis

(
    >++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.
)

! Run the function

Every function has its own tape.
```

## Installation

```bash
luarocks install cerebro
```

## Usage

1. Write your program
2. `cbc my_program.crb -o test.lua` for compile in lua, `cbc my_program.crb` for interpret.
3. Profit!
