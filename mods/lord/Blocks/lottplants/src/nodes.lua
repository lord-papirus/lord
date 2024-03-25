local S = minetest.get_translator("lottplants")

--Fireflies / Светлячки

minetest.register_node("lottplants:fireflies", {
	description  = S("Fireflies"),
	drawtype     = "glasslike",
	tiles        = {
		{
			name      = "lottplants_fireflies.png",
			animation = {
				type     = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length   = 2,
			},
		},
	},
	use_texture_alpha = "clip",
	paramtype    = "light",
	light_source = 8,
	walkable     = false,
	pointable    = true,
	diggable     = true,
	climbable    = false,
	buildable_to = true,
	drop         = "",
})

minetest.register_abm({
	nodenames = { "air" },
	neighbors = {
		"lottplants:elanor",
		"lottplants:niphredil",
	},
	interval  = 15,
	chance    = 600,
	action    = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() > 0.74 or minetest.get_timeofday() < 0.22 then
			--local water_nodes = minetest.find_nodes_in_area(minp, maxp, "group:water")
			--if #water_nodes > 0 then
			if minetest.find_node_near(pos, 3, "lottplants:fireflies") == nil then
				minetest.set_node(pos, { name = "lottplants:fireflies" })
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"group:flora"},
	neighbors = {"default:dirt_with_grass", "default:desert_sand"},
	interval = 50,
	chance = 25,
	action = function(pos, node)
		pos.y = pos.y - 1
		local under = minetest.get_node(pos)
		pos.y = pos.y + 1
		if under.name == "default:desert_sand" then
			minetest.set_node(pos, {name="lottplants:brambles_of_mordor"})
		elseif under.name ~= "default:dirt_with_grass" then
			return
		end

		local light = minetest.get_node_light(pos)
		if not light or light < 13 then
			return
		end

		local pos0 = {x=pos.x-4,y=pos.y-4,z=pos.z-4}
		local pos1 = {x=pos.x+4,y=pos.y+4,z=pos.z+4}
		if #minetest.find_nodes_in_area(pos0, pos1, "group:flora_block") > 0 then
			return
		end

		local flowers = minetest.find_nodes_in_area(pos0, pos1, "group:flora")
		if #flowers > 3 then
			return
		end

		local seedling = minetest.find_nodes_in_area(pos0, pos1, "default:dirt_with_grass")
		if #seedling > 0 then
			seedling = seedling[math.random(#seedling)]
			seedling.y = seedling.y + 1
			light = minetest.get_node_light(seedling)
			if not light or light < 13 then
				return
			end
			if minetest.get_node(seedling).name == "air" then
				minetest.set_node(seedling, {name=node.name})
			end
		end
	end,
})

minetest.register_craftitem("lottplants:honey", {
	description = S("Honey"),
	inventory_image = "lottplants_honey.png",
	on_use = minetest.item_eat(1),
})