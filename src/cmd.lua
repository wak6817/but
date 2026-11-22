local cmd = {}

local function new_input()
    io.write(SH)
    local input = io.read()
    cmd.run(input)
end

function cmd.run(input)
    if input == "new" then require("new").run()
    elseif input == "del" then print("go to ~/but/backups and delete a backup") -- TODO: Make this a selection menu
    elseif input == "list" then
        print("backups:")
        os.execute("ls -1 ~/but/backups/")
        new_input()
    elseif input == "help" then
        print("commands:")
        print("new")
        print("list")
        print("help")
        new_input()
    elseif input == "exit" then print("exited")
    else
        print("err: cmd not found")
        new_input()
    end
end

return cmd
