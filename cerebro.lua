--[[
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
]]

local cerebro = {}

function cerebro.compile(input)
    if not input then return end

    local code = {
        '--[[cerebro]]',
        'local cell={};local pointer=0;local read=io.read;local std=io.write;local char=string.char;local byte=string.byte;',
        'for i=0, 30000 do cell[i]=0 end;'
    }

    local function lexer(input)
        local instructions = {}

        input:gsub('%p', function(instruction) table.insert(instructions, instruction) end)

        return instructions
    end

    local instructions = {
        ['>'] = 'pointer=pointer+1;',
        ['<'] = 'pointer=pointer-1;',
        ['+'] = 'cell[pointer]=cell[pointer]+1;',
        ['-'] = 'cell[pointer]=cell[pointer]-1;',
        ['.'] = 'std(char(cell[pointer]));',
        [','] = 'cell[pointer]=byte(cell[pointer]);',
        ['['] = 'while cell[pointer]~=0 do ',
        [']'] = 'end;',
        ['('] = 'cell[pointer]=function() local cell={};local pointer=0;for i=0, 30000 do cell[i]=0 end;',
        [')'] = 'end;',
        ['!'] = 'cell[pointer]()'
    }

    for index, instruction in pairs(lexer(input)) do
        table.insert(code, instructions[instruction])
    end

    return table.concat(code, ' '), assert(loadstring(table.concat(code, ' ')))
end

return cerebro
