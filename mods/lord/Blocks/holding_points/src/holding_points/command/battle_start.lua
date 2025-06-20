local Manager = require('holding_points.Manager')

local S = minetest.get_mod_translator()

--- @type ChatCommandDefinition
local definition = {
	privs       = { server = true },
	description = S('Starts the Battle with name <battle_name>'),
	params      = '<battle_name>',
	func        = function(name, param)
		if param == '' then
			return false, S('No battle name specified')
		end

		local started, error = Manager.start_battle(param)
		if not started then
			return false, error
		end

		return true, S('Battle `@1` started', started.title)
	end
}


return {
	--- @type string
	NAME       = 'battle.start',
	--- @type ChatCommandDefinition
	definition = definition,
}


