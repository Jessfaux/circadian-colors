local M = {}

M.start_hour = 8
M.end_hour = 20

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
    M.set_colorscheme()
end

return M

