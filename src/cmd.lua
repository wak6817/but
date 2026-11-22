local cmd = {}

local function new_input()
    io.write(SH)
    local input = io.read()
    cmd.run(input)
end

function cmd.run(input)
    if input == "new" then
        require("new").run()
    elseif input == "del" then
        print("backups:")
        os.execute("ls -1 $HOME/but/backups/")
        io.write("backup to delete: ")
        new_input()
    elseif input == "list" then
        print("backups:")
        os.execute(
        "for f in \"$HOME\"/but/backups/*; do [ -e \"$f\" ] && du -h -d 0 \"$f\" | awk -F '\\t' '{n=$2; sub(/^.*\\//, \"\", n); print $1, n}'; done")
        new_input()
    elseif input == "help" then
        print("commands:")
        print("new")
        print("del")
        print("list")
        print("help")
        new_input()
    elseif input == "exit" then
        print("exited")
    else
        print("err: cmd not found")
        new_input()
    end
end

return cmd
