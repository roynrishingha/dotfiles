local telescope_ok, telescope = pcall(require, "telescope")
local actions_ok, actions = pcall(require, "telescope.actions")

if not (telescope_ok and actions_ok) then
    return
end

--- Call function if a condition is met
-- @param func the function to run
-- @param condition a boolean value of whether to run the function or not
local function conditional_func(func, condition, ...)
    -- if the condition is true or no condition is provided, evaluate the function with the rest of the parameters and return the result
    if (condition == nil or condition) and type(func) == "function" then return func(...) end
end

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = { ["q"] = actions.close },
        },
    },
})

conditional_func(telescope.load_extension, pcall(require, "notify"), "notify")
conditional_func(telescope.load_extension, pcall(require, "aerial"), "aerial")
