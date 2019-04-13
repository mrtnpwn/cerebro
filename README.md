# cerebro

A Brainfuck dialect that compiles to Lua.

## Installation

```bash
luarocks install cerebro
```

## Documentation

cerebro has the same Brainfuck opcodes, but addd new ones to complement the language:

- `{...}`: create a function and store it into the current cell

- `@`: execute a function stored in the current cell

- `~`: reset the current cell to 0

- `*`: multiply the cell value with itself and store the result in the current cell (cell * cell)

- `?`: move to a random cell

- `#`: exit the program

- `:`: same as `.` but it prints the numeric value instead

- `#include`: include instructiones from another program (ex: `#include "program.cerebro"`)

- `#error`: throw a compiler error (ex: `#error "a compier error"`)

## Usage

```bash
nano my_program.cerebro # Edit
cerebro -b my_program.cerebro main.lua # Compile
lua main.lua # Profit!
```

## Todo

- Add multiple compilation targets (JS, C, others)
- Add more directives (`#if`, `#else`, `#target`)

## License

```text
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
```
