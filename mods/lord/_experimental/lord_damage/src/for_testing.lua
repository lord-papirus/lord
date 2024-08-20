-- THis FILE CONTAINS ITEMS FOR TESTING PURPOSES ONLY! REMOVE IT WHEN THE DAMAGE SYSTEM IS INTEGRATED INTO THE GAME.

minetest.register_chatcommand("set_armor", {
    params = "<type> [value]",
    description = "",
    privs = { server = true },
    func = function(name, param)
		if not param or param == "" then
			return
		end
		local player = minetest.get_player_by_name(name)
		local protection_type = param:split(" ")[1]
		local value = tonumber(param:split(" ")[2])
		local armor = player:get_armor_groups()
		armor[protection_type] = value
		player:set_armor_groups(armor)
	end,
})

local damage_types = lord_damage.get_registered_damage_types()

minetest.register_tool("lord_damage:armor_type_applicator", {
	description = "Armor type applicator",
	on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		if not minetest.check_player_privs(player_name, "server") then
			minetest.log(player_name.." tried to use an Applicator.")
			return itemstack:clear()
		end
		local object = pointed_thing.ref
		if not object then
			minetest.chat_send_player(player_name, "Pointed thing is not an entity nor a player")
			return
		end
		minetest.show_formspec(player_name, "lord_damage:applicator",
		"size[8,9]"..
		"field[armor_type;Write in an armor type to apply;]"
		)
		minetest.register_on_player_receive_fields(function(player, formname, fields)
			if formname == "lord_damage:applicator" and fields.armor_type then
				local armor_type = fields.armor_type:split("=")[1]:gsub(" ", "")
				local armor_value = tonumber(fields.armor_type:split("=")[2]:gsub(" ", ""), 10) or nil
				local armor = object:get_armor_groups()
				armor[armor_type] = armor_value
				object:set_armor_groups(armor)
				return
			end
		end)

	end
})


for name, _ in pairs(damage_types) do
	minetest.register_tool("lord_damage:self_"..name.."_dealer",{
		description = "Self '".. name .." damage' dealer",
		on_use = function(itemstack, user, pointed_thing)
			local player_name = user:get_player_name()
			if not minetest.check_player_privs(player_name, "server") then
				minetest.log(player_name.." tried to use a damage dealer.")
				return itemstack:clear()
			end
			lord_damage.deal_damage(user, 13, name, { dealer = user, "lord_damage:self_"..name.."_dealer" }, nil, 3)
		end
	})
	minetest.register_tool("lord_damage:target_"..name.."_dealer",{
		description = "Target '".. name .." damage' dealer",
		on_use = function(itemstack, user, pointed_thing)
			local player_name = user:get_player_name()
			if not minetest.check_player_privs(player_name, "server") then
				minetest.log(player_name.." tried to use an damage dealer.")
				return itemstack:clear()
			end

			local object = pointed_thing.ref
			if not object then
				minetest.chat_send_player(player_name, "Pointed thing is not an entity nor a player")
				return
			end

			lord_damage.deal_damage(object, 13, name, { type = "set_hp",
					dealer = user, damage_type = name, tool = "lord_damage:target_"..name.."_dealer" }, nil, 3)
		end
	})
end

minetest.register_tool("lord_damage:target_source_burning_dealer",{
	description = "Target source 'burning' damage dealer",
	on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		if not minetest.check_player_privs(player_name, "server") then
			minetest.log(player_name.." tried to use an damage dealer.")
			return itemstack:clear()
		end

		local object = pointed_thing.ref
		if not object then
			minetest.chat_send_player(player_name, "Pointed thing is not an entity nor a player")
			return
		end

		local source = "burning"

		lord_damage.set_source(object, source, true)
		print(minetest.serialize(object:get_properties()))


		lord_damage.deal_damage(object, 13, "fiery_periodic", { type = "set_hp",
				dealer = user, damage_type = "fiery_periodic",
				tool = "lord_damage:target_source_burning_dealer", source = source }, source, 3)
	end
})

minetest.register_tool("lord_damage:target_source_burning_remover",{
	description = "Target source 'burning' state remover",
	on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		if not minetest.check_player_privs(player_name, "server") then
			minetest.log(player_name.." tried to use an damage dealer.")
			return itemstack:clear()
		end

		local object = pointed_thing.ref
		if not object then
			minetest.chat_send_player(player_name, "Pointed thing is not an entity nor a player")
			return
		end

		local source = "burning"

		lord_damage.set_source(object, source, nil)
	end
})
