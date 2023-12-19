local M = {}

M.start_hour = 8
M.end_hour = 20
print("Circadian colors loaded")
function M.set_colorscheme()
    local hour = os.date("*t").hour
    if hour >= M.start_hour and hour < M.end_hour then
        vim.cmd("colorscheme rose-pine-dawn")
    else
        vim.cmd("colorscheme rose-pine")
    end
end

function M.set_hours(start_hour, end_hour)
    M.start_hour = start_hour
    M.end_hour = end_hour
    M.set_colorscheme() -- Update the colorscheme immediately
end

vim.api.nvim_create_autocmd("VimEnter", { callback = M.set_colorscheme })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        M.set_colorscheme()
        vim.api.nvim_create_timer(60000, { callback = M.set_colorscheme }) -- checks every 60 seconds
    end
})

vim.api.nvim_create_user_command('CircadianSetHours', function(opts)
    local args = vim.split(opts.args, " ")
    if #args == 2 then
        local start_hour = tonumber(args[1])
        local end_hour = tonumber(args[2])
        if start_hour and end_hour then
            M.set_hours(start_hour, end_hour)
        else
            print("Invalid hours. Please enter numeric values.")
        end
    else
        print("Please enter two numbers: start hour and end hour.")
    end
end, { nargs = "*" })
print("CircadianSetHours command created")

return M
