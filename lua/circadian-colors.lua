local M = {}

function M.set_colorscheme()
    local hour = os.date("*t").hour
    if hour >= 8 and hour < 20 then
        vim.cmd("colorscheme rose-pine-dawn")
    else
        vim.cmd("colorscheme rose-pine")
    end
end

return M
