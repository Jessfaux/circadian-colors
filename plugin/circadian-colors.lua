local circadian = require('circadian-colors')

local function refreshColorscheme()
    circadian.set_colorscheme()

    local current_time = os.date("*t")
    local current_hour = current_time.hour
    local next_hour = circadian.next_refresh_time()
    local millis_till_next_hour

    if current_hour >= circadian.start_hour and current_hour < circadian.end_hour then
        -- Schedule for end_hour if we are currently in the day mode
        millis_till_next_hour = ((circadian.end_hour - current_hour) * 3600 - current_time.min * 60 - current_time.sec) *
        1000
    else
        -- Schedule for start_hour if we are currently in the night mode
        millis_till_next_hour = ((next_hour - current_hour) * 3600 - current_time.min * 60 - current_time.sec) * 1000
        if millis_till_next_hour < 0 then
            millis_till_next_hour = millis_till_next_hour + 86400000 -- Add 24 hours if the time is for the next day
        end
    end

    vim.defer_fn(refreshColorscheme, millis_till_next_hour)
end

-- Setup on VimEnter and command definition
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        refreshColorscheme()
    end
})

vim.api.nvim_create_user_command('CircadianSetHours', function(opts)
    local args = vim.split(opts.args, " ")
    if #args == 2 then
        local start_hour = tonumber(args[1])
        local end_hour = tonumber(args[2])
        if start_hour and end_hour then
            circadian.set_hours(start_hour, end_hour)
            refreshColorscheme()
        else
            print("Invalid hours. Please enter numeric values.")
        end
    else
        print("Please enter two numbers: start hour and end hour.")
    end
end, { nargs = "*" })
