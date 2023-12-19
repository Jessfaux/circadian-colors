local M = {}

M.start_hour = 8
M.end_hour = 20

function M.set_colorscheme()
    local hour = os.date("*t").hour
    if hour >= M.start_hour and hour < M.end_hour then
        vim.cmd("colorscheme rose-pine-dawn")
    else
        vim.cmd("colorscheme rose-pine-moon")
    end
end

function M.set_hours(start_hour, end_hour)
    M.start_hour = start_hour
    M.end_hour = end_hour
    M.set_colorscheme()
end

function M.next_refresh_time()
    local current_hour = os.date("*t").hour
    local next_hour = current_hour + 1
    if next_hour >= 24 then
        next_hour = next_hour - 24
    end
    if next_hour > M.end_hour or next_hour < M.start_hour then
        next_hour = M.start_hour
    end
    return next_hour
end

return M

