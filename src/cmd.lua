local cmd = {}

function cmd.run(input)
    if input == "new" then require("new").run()
    elseif input == "del" then
    elseif input == "list" then
    elseif input == "exit" then print("exited")
    else print("err: cmd not found")
    end
end

return cmd
