local cmd = {}

function cmd.run(input)
    if input == "new" then require("new").run()
    elseif input == "del" then
    elseif input == "list" then
        print("backups:")
        os.execute("ls -1 ~/but/backups/")
    elseif input == "help" then
        print("commands:")

        print("new")
        print("list")
        print("help")
    elseif input == "exit" then print("exited")
    else print("err: cmd not found")
    end
end

return cmd
