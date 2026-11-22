local new = {}

new.BDIR = os.getenv("HOME") .. "/but/backups"

function new.run()
    io.write("dir to backup: ")
    local dir = io.read()

    if not dir then
        return
    end

    if os.execute("test -d '" .. dir .. "'") ~= true
        and os.execute("test -d '" .. dir .. "'") ~= 0 then
        print("directory not found")
        return
    end

    os.execute("cp -R '" .. dir .. "' '" .. new.BDIR .. "'")
    print("backup is in " .. new.BDIR)
end

return new
