local new = {}

new.BDIR = os.getenv("HOME") .. "/but/backups/"

function new.run()
    io.write("dir to backup: ")
    local dir = io.read()

    if not dir then
        return
    end

    local result = os.execute("test -d '" .. dir .. "'")

    if result ~= true and result ~= 0 then
        print("directory not found")
        return
    end

    local dirname = dir:match("([^/]+)/?$")
    local date = os.date("%Y-%m-%d_%H-%M-%S")
    local dest = new.BDIR .. dirname .. " " .. date

    local status = os.execute("cp -R '" .. dir .. "' '" .. dest .. "'")

    if status == true or status == 0 then
        print("backup is in " .. dest)
    else
        print("err: backup failed")
    end
end

return new
