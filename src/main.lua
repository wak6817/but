local new = require "new"

local function dir_exists(path)
    local result = os.execute("test -d '" .. path .. "'")
    return result == true or result == 0
end

local cmd = require("cmd")
local sh = "> "
local c = 'y'

print("but backup util")

if not dir_exists(new.BDIR) then
    print("needed dir(s) not found")
    io.write("create? (y/n): ")
    c = io.read()

    if c == "y" then
        os.execute("mkdir -p '" .. new.BDIR .. "'")
    else
        print("exiting")
        return
    end
end

io.write(sh)
local input = io.read()

cmd.run(input)
