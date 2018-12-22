acklay = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "Acklay",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	level = 157,
	chanceHit = 25,
	damageMin = 200,
	damageMax = 950,
	baseXp = 49884,
	baseHAM = 70000,
	baseHAMmax = 100000,
	armor = 1,
	-- {kinetic,energy,blast,heat,cold,electricity,acid,stun,ls}
	resists = {40,45,55,55,45,45,40,40,0},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/acklay_hue.iff"},
	scale = 1.5,
	lootGroups = {
		{
	        groups =
			{
				{group = "armor_attachments", chance = 3500000},
				{group = "acklay", chance = 6500000}
			},
			lootChance = 4500000,
		},
		{
	        groups =
			{
				{group = "clothing_attachments", chance = 3500000},
				{group = "acklay", chance = 6500000}
			},
			lootChance = 4500000,
		},
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"posturedownattack","postureDownChance=75"}
	}
}

CreatureTemplates:addCreatureTemplate(acklay, "acklay")
