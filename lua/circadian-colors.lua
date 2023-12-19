local M = {}

local start_hour = vim.g.circadian_start_hour or 8
local end_hour = vim.g.circadian_end_hour or 20

function M.set_colorscheme()
    local hour = os.date("*t").hour
    if hour >= start_hour and hour < end_hour then
        vim.cmd("colorscheme rose-pine-dawn")
    else
        vim.cmd("colorscheme rose-pine")
    end
end

vim.api.nvim_create_autocmd("VimEnter", {callback = M.set_colorscheme})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        M.set_colorscheme()
        vim.api.nvim_create_timer(60000, {callback = M.set_colorscheme}) -- checks every 60 seconds
    end
})

return M

