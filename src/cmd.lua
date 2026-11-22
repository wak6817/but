local cmd = {}

function cmd.run(input)
    if input == "new" then
    elseif input == "del" then
    elseif input == "list" then
    else print("err: cmd not found")
    end
end

return cmd