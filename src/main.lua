local cmd = require "cmd"
local new = require "new"

local function dir_exists(path)
    local result = os.execute("test -d '" .. path .. "'")
    return result == true or result == 0
end

local function dir_check()
    if not dir_exists(new.BDIR) then
        print("needed dir(s) not found")
        io.write("create? (y/n): ")
        local c = io.read()

        if c == 'y' then
            os.execute("mkdir -p '" .. new.BDIR .. "'")
        elseif c == 'n' then
            print("exiting")
        else
            print("err: write \'y\' or \'n\' in lowercase")
            dir_check()
            return
        end
    end
end

SH = "> "

print("but backup util")
dir_check()

io.write(SH)
local input = io.read()

cmd.run(input)
