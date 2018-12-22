enhanced_gaping_spider = Creature:new {
	objectName = "@mob/creature_names:geonosian_gaping_spider_fire",
	customName = "Fire Breathing Spider",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 108,
  chanceHit = 2.5,
  damageMin = 715,
  damageMax = 1140,
  baseXp = 10267,
  baseHAM = 32000,
baseHAMmax = 39000,
	armor = 1,
	-- {kinetic,energy,blast,heat,cold,electricity,acid,stun,ls}
	resists = {50,35,25,95,45,35,25,45,5},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider.iff"},
	scale = 2.5,
	lootGroups = {
		{
			groups =
			{
				{group = "fire_breathing_spider", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
			groups =
			{
				{group = "armor_attachments", chance = 10000000}, -- 25%
			},
			lootChance = 2500000,
		},
		{
	        groups =
			{
				{group = "armor_attachments", chance = 1000000},
				{group = "geonosian_relic", chance = 9000000},
			},
			lootChance = 7500000,
		},
		{
			groups =
			{
				{group = "pistols", chance = 2500000},
				{group = "rifles", chance = 2500000},
				{group = "carbines", chance = 2500000},
				{group = "melee_weapons", chance = 2500000},
			},
			lootChance = 4000000,
		},
		{
			groups =
			{
				{group = "pistols", chance = 2500000},
				{group = "rifles", chance = 2500000},
				{group = "carbines", chance = 2500000},
				{group = "melee_weapons", chance = 2500000},
			},
			lootChance = 4000000,
		},
	},
	weapons = {"creature_spit_small_toxicgreen"},
	conversationTemplate = "",
	attacks = {
		{"strongpoison",""},
		{"stunattack","stunChance=85"}
	}
}

CreatureTemplates:addCreatureTemplate(enhanced_gaping_spider, "enhanced_gaping_spider")
