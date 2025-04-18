local api = require('fear_height.api')


mobs:register_mob("lottmobs:balrog", {
	type = "monster",
	--rotate = 180,
	hp_min = 1000,
	hp_max = 1250,
	collisionbox = {-0.8, -2.1, -0.8, 0.8, 2.6, 0.8},
	visual_size = {x=2, y=2},
	visual = "mesh",
	mesh = "balrog_model.b3d",
	textures = {
		{"lottmobs_balrog.png"},
	},
	makes_footstep_sound = true,
	view_range = 50,
	armor = { fleshy = 80, fire = 0, soul = 200 },
	walk_velocity = 1,
	run_velocity = 3,
	damage = 15,
	damage_type = "fire",
	drops = {
		{ name = "lottores:mithril_ingot",        chance = 5, min = 1,  max = 5, }, -- temporary reduced x 10
		{ name = "lottores:mithrilsword",         chance = 5, min = 1,  max = 1, },
		{ name = "lottores:mithrilpickaxe",       chance = 5, min = 1,  max = 1, },
		{ name = "lottweapons:mithril_battleaxe", chance = 5, min = 1,  max = 1, },
		{ name = "lottweapons:mithril_spear",     chance = 5, min = 1,  max = 1, },
		{ name = "lottweapons:mithril_battleaxe", chance = 5, min = 1,  max = 1, },
		{ name = "lottweapons:mithril_warhammer", chance = 5, min = 1,  max = 1, },
		{ name = "lottweapons:mithril_dagger",    chance = 5, min = 1,  max = 1, },
		{ name = "lord_archery:mithril_crossbow", chance = 5, min = 1,  max = 1, },
		{ name = "lord_projectiles:mithril_bolt", chance = 5, min = 10, max = 50, },
		{ name = "lottarmor:helmet_mithril",      chance = 5, min = 1,  max = 1, },
		{ name = "lottarmor:chestplate_mithril",  chance = 5, min = 1,  max = 1, },
		{ name = "lottarmor:leggings_mithril",    chance = 5, min = 1,  max = 1, },
		{ name = "lottarmor:boots_mithril",       chance = 5, min = 1,  max = 1, },
		{ name = "lottarmor:shield_mithril",      chance = 5, min = 1,  max = 1, },
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 12, -- shoot for 10 seconds
	dogshoot_count2_max = 3, -- dogfight for 3 seconds
	reach = 3,
	shoot_interval = 2.5,
	arrow = "lord_projectiles:fire_ball",
	shoot_offset = 1,
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	animation = {
		stand_start = 0,
		stand_end = 240,
		walk_start = 240,
		walk_end = 300,
		punch_start = 300,
		punch_end = 380,
		speed_normal = 15,
		speed_run = 15,
	},
	do_custom = function (self)
		api.set_fear_height_by_state(self)
	end
})
