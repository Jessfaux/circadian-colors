local circadian = require('circadian-colors')

-- Setup the colorscheme on VimEnter and create a timer to check every 60 seconds
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        circadian.set_colorscheme()
        vim.api.nvim_create_timer(60000, { callback = circadian.set_colorscheme }) -- checks every 60 seconds
    end
})

-- Command for setting the hours
vim.api.nvim_create_user_command('CircadianSetHours', function(opts)
    local args = vim.split(opts.args, " ")
    if #args == 2 then
        local start_hour = tonumber(args[1])
        local end_hour = tonumber(args[2])
        if start_hour and end_hour then
            circadian.set_hours(start_hour, end_hour)
        else
            print("Invalid hours. Please enter numeric values.")
        end
    else
        print("Please enter two numbers: start hour and end hour.")
    end
end, { nargs = "*" })

