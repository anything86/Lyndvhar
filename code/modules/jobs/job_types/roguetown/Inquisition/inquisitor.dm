/datum/job/roguetown/inquisitor
	title = "Inquisitor"
	flag = INQUISITOR
	department_flag = INQUISITION
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_RESPECTED_UP
	allowed_patrons = list(/datum/patron/old_god) //You MUST have a Psydonite character to start. Just so people don't get japed into Oops Suddenly Psydon!
	tutorial = "You are the direct hand of the Psydonic inquisition. You have been sent by the Bisphoric of Valoria, the leading realm of the Psydonian Orthodoxy, on a diplomatic misssion.. officially, that is. /n /n Unofficially, you work to cast out the sinners from God's house. Heresy of all kinds must be corrected; from Pantheon-worshippers that stray too far towards heretical thought, to fools that worship the Daemons, and converting those willing. The city of Lyndvhar tolerates you due to your ability to fight the daemonic, and the Pantheonic Church tolerates you due to your aligned goals...but it is probably best to not let them peer too closely."
	whitelist_req = TRUE
	cmode_music = 'sound/music/inquisitorcombat.ogg'
	selection_color = JCOLOR_INQUISITION

	outfit = /datum/outfit/job/roguetown/inquisitor
	display_order = JDO_INQUISITOR
	advclass_cat_rolls = list(CTAG_INQUISITOR = 20)
	give_bank_account = 30
	min_pq = 4
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/inquisitor
	name = "Inquisitor"
	jobtype = /datum/job/roguetown/inquisitor
	allowed_patrons = list(/datum/patron/old_god)

/datum/job/roguetown/inquisitor/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")


////Classic Inquisitor with a much more underground twist. Use listening devices, sneak into places to gather evidence, track down suspicious individuals. Has relatively the same utility stats as Confessor, but fulfills a different niche in terms of their combative job as the head honcho. 

/datum/advclass/inquisitor/inspector
	name = "Inspector"
	tutorial = "Your eternal service to fighting monsters has manifested within you into a profession of underground connections of Confessors, away from the prying eyes of others. Stop daemonic activities in their tracks, predict their movements, collect evidence through listening devices and, when the time comes - strike with impunity with your blade and swift dodging prowess."
	outfit = /datum/outfit/job/roguetown/inquisitor/inspector

	category_tags = list(CTAG_INQUISITOR)

/datum/outfit/job/roguetown/inquisitor/inspector/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/psydon
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/cape/inquisitor
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/puritan
	gloves = /obj/item/clothing/gloves/roguetown/leather
	beltl = /obj/item/rogueweapon/sword/rapier
	backpack_contents = list(/obj/item/storage/keyring/inquisitor = 1, /obj/item/lockpickring/mundane = 1, /obj/item/rogueweapon/huntingknife/idagger/silver)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("perception", 3)
		H.change_stat("speed", 2)
		H.change_stat("intelligence", 3)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)

///The dirty, violent side of the Inquisition. Meant for confrontational, conflict-driven situations as opposed to simply sneaking around and asking questions. Templar with none of the miracles, but with all the muscles and more. 

/datum/advclass/inquisitor/muscle
	name = "Daemon Hunter"
	tutorial = "Your specialty in the Inquisition was never fruitful in terms of espionage and stealth or the mystic miracles of Psydon. You had a unique talent in busting down doors to secret churches and worship spots, extracting confessions on the spot out of those who did not yield to Psydon, and driving out the Daemons with a silver blade. Face down the FORCES OF EVIL with whips and chains. You are Psydon's fist."
	outfit = /datum/outfit/job/roguetown/inquisitor/muscle
	cmode_music = 'sound/music/templarofpsydonia.ogg'

	category_tags = list(CTAG_INQUISITOR)

/datum/outfit/job/roguetown/inquisitor/muscle/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/fluted
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blk
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/blk
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	pants = /obj/item/clothing/under/roguetown/chainlegs/blk
	cloak = /obj/item/clothing/cloak/psydontabard
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/roguehood/psydon
	gloves = /obj/item/clothing/gloves/roguetown/chain/psydon
	beltl = /obj/item/rogueweapon/mace/silver
	backpack_contents = list(/obj/item/storage/keyring/inquisitor = 1, /obj/item/rogueweapon/huntingknife/idagger/silver)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE) /// Swords? When you should be bashing skulls?
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2) 
		H.change_stat("constitution", 2)
		H.change_stat("speed", -1)

	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)

/obj/item/clothing/gloves/roguetown/chain/blk
		color = CLOTHING_GREY

/obj/item/clothing/under/roguetown/chainlegs/blk
		color = CLOTHING_GREY

/obj/item/clothing/suit/roguetown/armor/plate/blk
		color = CLOTHING_GREY

/obj/item/clothing/shoes/roguetown/boots/armor/blk
		color = CLOTHING_GREY



/datum/advclass/inquisitor/gangster
	name = "Puritan"
	tutorial = "Abandoning your titles and estate in the republic, you joined with the Valorian Inquisition in order to fight the heretical and monsters abroad. Serving no true specialty, your blade has been your go-to option for problems-- as well as your silver tongue. Despite abandoning your titles, you are still seen by many as noble-blooded, and that can get you places in Psydon's name."
	outfit = /datum/outfit/job/roguetown/inquisitor/gangster

	category_tags = list(CTAG_INQUISITOR)

/datum/outfit/job/roguetown/inquisitor/gangster/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/psydon
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	shoes = /obj/item/clothing/shoes/roguetown/valorian/inqboots
	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/inqhat
	gloves = /obj/item/clothing/gloves/roguetown/valorian/inqgloves
	beltl = /obj/item/rogueweapon/sword/rapier
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat
	backpack_contents = list(/obj/item/storage/keyring/inquisitor = 1, /obj/item/rogueweapon/huntingknife/idagger/silver)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 3)
		H.change_stat("perception", 3)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 3)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/mob/living/carbon/human/proc/torture_victim()
	set name = "Extract Confession"
	set category = "Inquisition"
	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	var/obj/item/S = get_inactive_held_item()
	if(!istype(I) || !ishuman(I.grabbed))
		to_chat(src, span_warning("I don't have a victim in my hands!"))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	if (!H.restrained())
		to_chat(src, span_warning ("My victim needs to be restrained in order to do this!"))
		return
	if(!istype(S, /obj/item/clothing/neck/roguetown/psicross/silver))
		to_chat(src, span_warning("I need to be holding a silver psycross to extract this divination!"))
		return
	if(!H.stat)
		var/static/list/torture_lines = list(
			"CONFESS!",
			"TELL ME YOUR SECRETS!",
			"SPEAK!",
			"YOU WILL SPEAK!",
			"TELL ME!",
		)
		say(pick(torture_lines), spans = list("torture"))
		src.visible_message(span_warning("[src]'s silver psycross abruptly catches flame, burning away in an instant!"))
		H.confess_sins("antag")
		qdel(S)
		return
	to_chat(src, span_warning("This one is not in a ready state to be questioned..."))

/mob/living/carbon/human/proc/faith_test()
	set name = "Test Faith"
	set category = "Inquisition"
	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	var/obj/item/S = get_inactive_held_item()
	if(!istype(I) || !ishuman(I.grabbed))
		to_chat(src, span_warning("I don't have a victim in my hands!"))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	if (!H.restrained())
		to_chat(src, span_warning ("My victim needs to be restrained in order to do this!"))
		return
	if(!istype(S, /obj/item/clothing/neck/roguetown/psicross/silver))
		to_chat(src, span_warning("I need to be holding a silver psycross to extract this divination!"))
		return
	if(!H.stat)
		var/static/list/faith_lines = list(
			"DO YOU DENY THE GODS?",
			"WHO IS YOUR GOD?",
			"ARE YOU FAITHFUL?",
			"WHO IS YOUR SHEPHERD?",
		)
		say(pick(faith_lines), spans = list("torture"))
		src.visible_message(span_warning("[src]'s silver psycross abruptly catches flame, burning away in an instant!"))
		H.confess_sins("patron")
		qdel(S)
		return
	to_chat(src, span_warning("This one is not in a ready state to be questioned..."))

/mob/living/carbon/human/proc/confess_sins(confession_type = "antag")
	var/static/list/innocent_lines = list(
		"I AM NO SINNER!",
		"I'M INNOCENT!",
		"I HAVE NOTHING TO CONFESS!",
		"I AM FAITHFUL!",
	)
	var/list/confessions = list()
	switch(confession_type)
		if("patron")
			if(length(patron?.confess_lines))
				confessions += patron.confess_lines
		if("antag")
			for(var/datum/antagonist/antag in mind?.antag_datums)
				if(!length(antag.confess_lines))
					continue
				confessions += antag.confess_lines
	if(length(confessions))
		say(pick(confessions), spans = list("torture"))
		return
	say(pick(innocent_lines), spans = list("torture"))
