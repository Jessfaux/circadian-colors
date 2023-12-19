local circadian = require('circadian-colors')

local function refreshColorscheme()
    circadian.set_colorscheme()

    local next_hour = circadian.next_refresh_time()
    local current_time = os.date("*t")
    local millis_till_next_hour = ((next_hour - current_time.hour) * 3600 - current_time.min * 60 - current_time.sec) * 1000

    -- Schedule the function again at the start of the next relevant hour
    vim.defer_fn(refreshColorscheme, millis_till_next_hour)
end

-- Command for setting the hours
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
