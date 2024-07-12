mobs:register_mob("lottmobs:dunlending", {
	type = "monster",
	hp_min = 17,
	hp_max = 27,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "human_model.x",
	textures = {
		{"lottmobs_dunlending.png"},
		{"lottmobs_dunlending_1.png"},
		{"lottmobs_dunlending_2.png"},
		{"lottmobs_dunlending_3.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	armor = 200,
	run_velocity = 3,
	damage = 3,
	drops = {
		{ name = "lottores:tinpick",          chance = 10, min = 1, max = 1, },
		{ name = "lottores:tinaxe",           chance = 10, min = 1, max = 1, },
		{ name = "lottores:tinshovel",        chance = 10, min = 1, max = 1, },
		{ name = "lottores:tinspear",         chance = 10, min = 1, max = 1, },
		{ name = "lottweapons:tin_battleaxe", chance = 15, min = 1, max = 1, },
		{ name = "lottweapons:tin_spear",     chance = 15, min = 1, max = 1, },
		{ name = "lottweapons:tin_warhammer", chance = 15, min = 1, max = 1, },
		{ name = "lottweapons:tin_dagger",    chance = 15, min = 1, max = 1, },
		{ name = "lottarmor:helmet_tin",      chance = 20, min = 1, max = 1, },
		{ name = "lottarmor:chestplate_tin",  chance = 20, min = 1, max = 1, },
		{ name = "lottarmor:leggings_tin",    chance = 20, min = 1, max = 1, },
		{ name = "lottarmor:boots_tin",       chance = 20, min = 1, max = 1, },
		{ name = "lottmobs:dirty_trousers",   chance = 10, min = 1, max = 1, },
		{ name = "lottmobs:dirty_shirt",      chance = 10, min = 1, max = 1, },
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell2",
		death = "mobs_barbarian_death",
		attack = "default_punch2",
	},
	step = 1,
})
