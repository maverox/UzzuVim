return {
  'goolord/alpha-nvim',
  event = 'VimEnter', -- load plugin after all configuration is set
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    -- _Gopts = {
    -- position = 'center',
    -- hl = 'Type',
    -- wrap = "overflow";
    -- }

    --  -- Set menu
    alpha.setup(dashboard.opts)

    -- require('alpha').setup(dashboard.opts)

    -- vim.api.nvim_create_autocmd("User", {
    -- 	pattern = "LazyVimStarted",
    -- 	callback = function()
    -- 		local stats = require("lazy").stats()
    -- 		local count = (math.floor(stats.startuptime * 100) / 100)
    -- 		dashboard.section.footer.val = {
    -- 			"󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
    -- 			" ",
    -- 			"      Mohammed Babiker Babai",
    -- 		}
    -- 		pcall(vim.cmd.AlphaRedraw)
    -- 	end,
    -- })
  end,
}
