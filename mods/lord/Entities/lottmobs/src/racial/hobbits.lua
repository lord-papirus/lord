local api = require('fear_height.api')


mobs:register_mob("lottmobs:hobbit", {
	type = "npc",
	hp_min = 5,
	hp_max = 15,
	collisionbox = { -0.33, -0.75, -0.33, 0.33, 0.6, 0.33 },
	textures = {
		{"lottmobs_hobbit.png"},
		{"lottmobs_hobbit_1.png"},
		{"lottmobs_hobbit_2.png"},
		{"lottmobs_hobbit_3.png"},
	},
	visual = "mesh",
	visual_size = {x = 0.825, y = 0.75},
	mesh = "dwarf_character.b3d",
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 1,
	run_velocity = 3.5,
	armor = 300,
	damage = 3,
	drops = {
		{ name = "lottfarming:corn_seed",       chance = 5,  min = 3, max = 10, },
		{ name = "lottfarming:berries_seed",    chance = 5,  min = 3, max = 10, },
		{ name = "lottfarming:barley_seed",     chance = 5,  min = 3, max = 10, },
		{ name = "lottfarming:pipeweed_seed",   chance = 5,  min = 3, max = 10, },
		{ name = "lottfarming:potato_seed",     chance = 5,  min = 3, max = 10, },
		{ name = "lottfarming:pipeweed",        chance = 10, min = 1, max = 4, },
		{ name = "lottfarming:pipe",            chance = 10, min = 1, max = 1, },
		{ name = "lottfarming:tomatoes_cooked", chance = 15, min = 1, max = 7, },
		{ name = "lottfarming:turnip_cooked",   chance = 15, min = 1, max = 7, },
		{ name = "lottfarming:melon",           chance = 15, min = 1, max = 7, },
		{ name = "lord_alcohol:ale",              chance = 20, min = 1, max = 5, },
		{ name = "lord_alcohol:wine",             chance = 20, min = 1, max = 5, },
		{ name = "lord_alcohol:beer",             chance = 20, min = 1, max = 5, },
		{ name = "lord_alcohol:cider",            chance = 20, min = 1, max = 5, },
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
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
	step=1,
	--passive = true,
	attacks_monsters = true,
	group_attack = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	do_custom = function (self)
		api.set_fear_height_by_state(self)
	end
})
--mobs:register_spawn("lottmobs:hobbit", {"lord_ground:dirt_shire"}, 20, -1, 6000, 3, 31000)
