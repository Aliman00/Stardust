exar_kun_warrior = Creature:new {
	customName = "A Caretaker Protector",
	randomNameTag = true,
	socialGroup = "kun",
	faction = "kun",
	level = 188,
	chanceHit = 0.8,
	damageMin = 1500,
	damageMax = 2000,
	baseXp = 8408,
	baseHAM = 100000,
	baseHAMmax = 100000,
	armor = 1,
	resists = {45,45,45,100,0,100,100,100,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE + ENEMY,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/exar_kun_warrior.iff"},
	lootGroups = {},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(fencermid,swordsmanmid,tkamid,pikemanmaster,brawlermaster,forcewielder)
}

CreatureTemplates:addCreatureTemplate(exar_kun_warrior, "exar_kun_warrior")
