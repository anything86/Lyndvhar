//shield flail or longsword, tief can be this with red cross	

/datum/job/roguetown/templar
	title = "Templar"
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "Having forsaken your own wealth and any titles you may have possessed to serve the Pantheon either due to past transgressions or dutiful zealotry, you serve as a Templar of the Most Holy, charged with the protection of the Church of Lyndvhar. You are one of the first lines of defense of what may lurk in the dark. Serve the Church faithfully, and perhaps you will live to see the dae when the realm is pure once more."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS
	outfit = /datum/outfit/job/roguetown/templar
	min_pq = 3 //Deus vult, but only according to the proper escalation rules
	max_pq = null
	round_contrib_points = 2
	total_positions = 3
	spawn_positions = 3
	advclass_cat_rolls = list(CTAG_TEMPLAR = 20)
	display_order = JDO_TEMPLAR
	
	give_bank_account = TRUE

/datum/outfit/job/roguetown/templar
	has_loadout = TRUE
	allowed_patrons = ALL_PALADIN_PATRONS
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/churchie
	id = /obj/item/clothing/ring/silver
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/ritechalk)
	
/datum/job/roguetown/templar/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/templar/monk
	name = "Monk"
	tutorial = "You are a monk of the Church, trained in pugilism and acrobatics. You bear no armor but your faith, and your hands are lethal weapons in service to your God."
	outfit = /datum/outfit/job/roguetown/templar/monk
	
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/monk/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			cloak = /obj/item/clothing/cloak/tabard/crusader/astrata
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
			cloak = /obj/item/clothing/cloak/abyssortabard	
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			cloak = /obj/item/clothing/cloak/tabard/crusader/necra
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
			cloak = /obj/item/clothing/cloak/tabard/crusader/pestra
		if(/datum/patron/divine/eora) //Eora content from stonekeep
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			cloak = /obj/item/clothing/cloak/tabard/crusader/eora
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
			cloak = /obj/item/clothing/cloak/tabard/crusader/noc
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
			cloak = /obj/item/clothing/cloak/tabard/crusader/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
			cloak = /obj/item/clothing/cloak/tabard/crusader/malum
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	r_hand = /obj/item/rogueweapon/katar
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/divine/pestra)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/divine/malum)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)
		H.cmode_music = 'sound/music/combat_holy.ogg'
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
		H.change_stat("perception", -2)

		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)


	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/advclass/templar/crusader
	name = "Templar"
	tutorial = "You are a templar of the Church, trained in heavy weaponry and zealous warfare. You are the instrument of your God's wrath, clad in steel and faith."
	outfit = /datum/outfit/job/roguetown/templar/crusader
	
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/crusader/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
			head = /obj/item/clothing/head/roguetown/helmet/heavy/astratan
			cloak = /obj/item/clothing/cloak/templar/astratan
		if(/datum/patron/divine/abyssor)
			wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/abyssorgreathelm
			cloak = /obj/item/clothing/cloak/abyssortabard
		if(/datum/patron/divine/dendor)
			wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
		if(/datum/patron/divine/necra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/necra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/necran
			cloak = /obj/item/clothing/cloak/templar/necran
		if(/datum/patron/divine/pestra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/pestran
			cloak = /obj/item/clothing/cloak/templar/pestran
		if(/datum/patron/divine/eora) //Eora content from stonekeep
			wrists = /obj/item/clothing/neck/roguetown/psicross/eora
			head = /obj/item/clothing/head/roguetown/helmet/sallet/eoran
			cloak = /obj/item/clothing/cloak/tabard/crusader/eora
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/roguetown/psicross/noc
			head = /obj/item/clothing/head/roguetown/helmet/heavy/nochelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/noc
		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
			head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/gold
			cloak = /obj/item/clothing/cloak/tabard/crusader/ravox
		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/roguetown/psicross/malum
			cloak = /obj/item/clothing/cloak/templar/malumite
			head = /obj/item/clothing/head/roguetown/helmet/heavy/malum
		if(/datum/patron/old_god)
			wrists = /obj/item/clothing/neck/roguetown/psicross
			cloak = /obj/item/clothing/cloak/tabard/crusader/psydon
	backr = /obj/item/rogueweapon/shield/tower/metal
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	armor = /obj/item/clothing/suit/roguetown/armor/plate	///Half-Plate not fullplate
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/divine/pestra)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/divine/malum)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)	//May tone down to 2; seems OK.
		H.cmode_music = 'sound/music/combat_holy.ogg'
		H.change_stat("strength", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 3)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/templar/crusader/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Bastard Sword","Flail","Mace","Battle Axe")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Bastard Sword")
			H.put_in_hands(new /obj/item/rogueweapon/sword/long(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Flail")
			H.put_in_hands(new /obj/item/rogueweapon/flail(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		if("Mace")
			H.put_in_hands(new /obj/item/rogueweapon/mace(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Battle Axe")
			H.put_in_hands(new /obj/item/rogueweapon/stoneaxe/battle(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
