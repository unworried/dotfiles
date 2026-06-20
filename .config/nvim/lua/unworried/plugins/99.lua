return {
  "ThePrimeagen/99",
  config = function()
    local _99 = require("99")
    _99.setup({
      show_in_flight_requests = true,
      md_files = {
        "AGENTS.md",
      },
      completion = {
        source = "blink",
      },
      model = "openai/gpt-5.3-codex",
    })
    vim.keymap.set("n", "<leader>9s", function()
      _99.search()
    end)
    vim.keymap.set("v", "<leader>9vv", function()
      _99.visual()
    end)
  end,
}
