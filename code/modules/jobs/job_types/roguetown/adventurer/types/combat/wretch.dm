/datum/advclass/wretch
	name = "Wretch"
	tutorial = "Wretched, vile souls - cast out from society for their sins."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	maximum_possible_slots = 5
	outfit = /datum/outfit/job/roguetown/adventurer/wretch
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER)
	category_tags = list(CTAG_ADVENTURER)
	classes = list("Deserter" = "You were once a venerated and revered knight - now, a traitor who abandoned your liege. You live the life of an outlaw, shunned and looked down upon by society.",
					"Outlaw" = "You're a seasoned criminal known for your heinous acts, your face plastered on wanted posters across the region. A life of theft, robbery, and ill-gotten-gains comes naturally to you.",
					"Poacher" = "You have rejected society and its laws, choosing life in the wilderness instead. Simple thieving highwayman or freedom fighter, you take from those who have and give to the have-nots. Fancy, how that includes yourself!",
					"Heretic" = "You are a heretic, spurned by the church, cast out from society - frowned upon by Astrata and her siblings for your faith.",
					"Necromancer" = "You have been ostracized and hunted by society for your dark magics and perversion of life.")


/datum/outfit/job/roguetown/adventurer/wretch/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Deserter","Outlaw","Poacher","Heretic","Necromancer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Deserter")
			to_chat(H, span_warning("You were once a venerated and revered knight - now, a traitor who abandoned your liege. You live the life of an outlaw, shunned and looked down upon by society."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			ADD_TRAIT (H, TRAIT_OUTLAW, TRAIT_GENERIC)
			var/weapons = list("Estoc","Mace + Shield","Flail + Shield","Lucerne","Battle Axe")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Estoc")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					r_hand = /obj/item/rogueweapon/estoc
					backr = /obj/item/gwstrap
				if("Mace + Shield")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace/steel
					backr = /obj/item/rogueweapon/shield/tower/metal
				if("Flail + Shield")
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					beltr = /obj/item/rogueweapon/flail/sflail
					backr = /obj/item/rogueweapon/shield/tower/metal
				if("Lucerne")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
					r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
					backr = /obj/item/gwstrap
				if("Battle Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					backr = /obj/item/rogueweapon/stoneaxe/battle
			H.change_stat("strength", 1)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 1)
			head = /obj/item/clothing/head/roguetown/helmet/kettle
			gloves = /obj/item/clothing/gloves/roguetown/leather
			pants = /obj/item/clothing/under/roguetown/chainlegs
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/steel
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)
			GLOB.outlawed_players += H.real_name
			var/my_crime = input(H, "What is your crime?", "Crime") as text|null
			if (!my_crime)
				my_crime = "crimes against the Crown"
			var/bounty_total
			bounty_total = rand(151, 250)
			add_bounty(H.real_name, bounty_total, FALSE, my_crime, "The Justiciary of Lyndvhar")
		
		if("Outlaw")
			to_chat(H, span_warning("You're a seasoned criminal known for your heinous acts, your face plastered on wanted posters across the region. A life of theft, robbery, and ill-gotten-gains comes naturally to you."))
			pants = /obj/item/clothing/under/roguetown/trou/leather
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			beltl = /obj/item/lockpickring/mundane
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/traps, 5, TRUE)
			H.cmode_music = 'sound/music/combat_vaquero.ogg'
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_OUTLAW, TRAIT_GENERIC)
			var/weapons = list("Rapier","Dagger", "Whip")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Rapier")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/rapier
				if("Dagger")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
					beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
				if ("Whip")
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					beltr = /obj/item/rogueweapon/whip
			H.change_stat("strength", -1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			GLOB.outlawed_players += H.real_name
			var/my_crime = input(H, "What is your crime?", "Crime") as text|null
			if (!my_crime)
				my_crime = "crimes against the Crown"
			var/bounty_total
			bounty_total = rand(151, 250)
			add_bounty(H.real_name, bounty_total, FALSE, my_crime, "The Justiciary of Lyndvhar")

		if("Poacher")
			to_chat(H, span_warning("You have rejected society and its laws, choosing life in the wilderness instead. Simple thieving highwayman or freedom fighter, you take from those who have and give to the have-nots. Fancy, how the latter includes yourself!"))
			head = /obj/item/clothing/head/roguetown/roguehood/darkgreen
			pants = /obj/item/clothing/under/roguetown/trou/leather
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/darkgreen
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			beltl = /obj/item/quiver/arrows
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/bait = 1, /obj/item/rogueweapon/huntingknife = 1)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/traps, 4, TRUE)
			//these people live in the forest so let's give them some peasant skills
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
			H.cmode_music = 'sound/music/combat_poacher.ogg'
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_OUTLAW, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_OUTDOORSMAN, TRAIT_GENERIC)
			var/weapons = list("Dagger","Axe", "Cudgel", "My Bow Is Enough")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Dagger")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
					beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
				if("Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/woodcut
				if ("Cudgel")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
					beltr = /obj/item/rogueweapon/mace/cudgel
				if ("My Bow Is Enough")
					H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
					head = /obj/item/clothing/head/roguetown/duelhat
			H.change_stat("endurance", 1)
			H.change_stat("perception", 2)
			H.change_stat("speed", 2)
			GLOB.outlawed_players += H.real_name
			var/my_crime = input(H, "What is your crime?", "Crime") as text|null
			if (!my_crime)
				my_crime = "crimes against the Crown"
			var/bounty_total
			bounty_total = rand(151, 250)
			add_bounty(H.real_name, bounty_total, FALSE, my_crime, "The Justiciary of Lyndvhar")


		if("Heretic")
			to_chat(H, span_warning("You are a heretic, spurned by the church, cast out from society - frowned upon by Astrata and her siblings for your faith."))
			if (!(istype(H.patron, /datum/patron/inhumen/zizo) || istype(H.patron, /datum/patron/inhumen/matthios)))
				to_chat(H, span_warning("My former deity frowned upon my practices. I have since turned to a new god."))
				H.set_patron(pick(/datum/patron/inhumen/zizo, /datum/patron/inhumen/matthios))
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
			H.set_blindness(0)
			var/weapons = list("Bastard Sword","Mace","Flail")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Bastard Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/long
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace/steel
				if("Flail")
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					beltr = /obj/item/rogueweapon/flail/sflail
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 1)
			if (istype (H.patron, /datum/patron/inhumen/zizo))
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order) //fuck you no helmet
			cloak = /obj/item/clothing/cloak/cape/crusader
			gloves = /obj/item/clothing/gloves/roguetown/chain/blk
			pants = /obj/item/clothing/under/roguetown/trou/leather
			neck = /obj/item/clothing/neck/roguetown/gorget
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/tower
			beltl = /obj/item/roguekey/inhumen
			backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/ritechalk = 1)
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells(H)
			START_PROCESSING(SSobj, C)
			GLOB.excommunicated_players += H.real_name
			var/my_crime = input(H, "What is your crime?", "Crime") as text|null
			if (!my_crime)
				my_crime = "crimes against the Ten"
			var/bounty_total
			bounty_total = rand(151, 250)
			add_bounty(H.real_name, bounty_total, FALSE, my_crime, "The Holy Inquisition of Lyndvhar")
			H.cmode_music = 'sound/music/combat_cult.ogg'
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

		if("Necromancer")
			H.set_patron(/datum/patron/inhumen/zizo)
			to_chat(H, span_warning("You have been ostracized and hunted by society for your dark magics and perversion of life."))
			head = /obj/item/clothing/head/roguetown/roguehood/black
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/trou/leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/huntingknife
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/woodstaff
			backpack_contents = list(/obj/item/spellbook_unfinished/pre_arcyne = 1, /obj/item/roguegem/amethyst = 1, /obj/item/roguekey/inhumen = 1, /obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
			ADD_TRAIT(H, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
			H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
			H.cmode_music = 'sound/music/combat_cult.ogg'
			if(H.age == AGE_OLD)
				H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
				H.mind.adjust_spellpoints(1)
			H.change_stat("intelligence", 3)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_lesser_undead/necromancer)
			H.mind.adjust_spellpoints(1)
			GLOB.excommunicated_players += H.real_name
			var/my_crime = input(H, "What is your crime?", "Crime") as text|null
			if (!my_crime)
				my_crime = "crimes against the Ten"
			var/bounty_total
			bounty_total = rand(151, 250)
			add_bounty(H.real_name, bounty_total, FALSE, my_crime, "The Holy Inquisition of Lyndvhar")
