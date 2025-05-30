local S = minetest.get_mod_translator()

return {
	recipes = {
		{
			output = 'grinder:roll',
			recipe = {
				{'default:steel_ingot', 'default:diamond', 'default:steel_ingot'},
				{'carts:gear', 'default:steel_ingot', 'carts:gear'},
				{'default:diamond', 'default:steel_ingot', 'default:diamond'},
			}
		},
		{
			output = 'grinder:grinder',
			recipe = {
				{'grinder:roll', '', 'grinder:roll'},
				{'default:steel_ingot', 'carts:gear', 'default:steel_ingot'},
				{'default:obsidian', 'carts:steam_mechanism', 'default:obsidian'},
			}
		},
		{
			type = 'fuel',
			recipe = 'grinder:coal_dust',
			burntime = 50,
		},
	},
	items = {
		{
			name = 'grinder:coal_dust',
			definition = {
				description = S('Coal dust'),
				inventory_image = 'grinder_coal_dust.png',
				groups = {fuel=1,coal=1},
			}
		},
		{
			name = 'grinder:roll',
			definition = {
				description = S('Roll'),
				inventory_image = 'grinder_roll.png',
			}
		},
	},
}
