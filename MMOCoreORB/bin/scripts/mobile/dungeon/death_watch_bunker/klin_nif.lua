klin_nif = Creature:new {
	objectName = "",
	customName = "Klin Nif",
	socialGroup = "death_watch",
	faction = "",
	level = 278,
	chanceHit = 12.25,
	damageMin = 500,
	damageMax = 750,
	baseXp = 16794,
	baseHAM = 100000,
	baseHAMmax = 250000,
	armor = 1,
	resists = {75,75,90,80,45,45,100,70,20},
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,

	templates = {"object/mobile/dressed_death_watch_silver.iff"},
	lootGroups = {
		{
			groups = {
				{group = "klin_nif_drop", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 500000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 750000
		}
	},
	weapons = {"death_watch_commander_weapons"},
	conversationTemplate = "",
	attacks = merge(carbineermaster,marksmanmaster,brawlermaster,fencermaster,pistoleermaster)
}

CreatureTemplates:addCreatureTemplate(klin_nif, "klin_nif")
