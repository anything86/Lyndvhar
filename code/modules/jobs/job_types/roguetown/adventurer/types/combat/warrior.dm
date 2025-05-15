/datum/advclass/sfighter
	name = "Warrior"
	tutorial = "Trained warriors and estemeed swordsmen from all corners of the world, \
	warriors are defined by martial prowess - whether with a blade or their bare fists."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER)
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Fighter" = "Vagrant sellswords, deserters, and hardened vagabonds searching for purpose. Very few survive this life...many dying from their own foolish or desperate attempts at survival. Who will you be? ",
					"Duelist" = "A thrill seeking duelist who foregoes armor in exchange for a more nimble fighting style.",
					"Barbarian" = "A brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling.")


/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Fighter","Duelist","Barbarian")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

	

		if("Fighter")
			to_chat(H, span_warning("Vagrant sellswords, deserters, and hardened vagabonds searching for purpose. Very few survive this life...many dying from their own foolish or desperate attempts at survival. Who will you be? "))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			var/weapons = list("Iron Sword","Mace","Spear","Axe")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Iron Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/iron
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace
				if("Spear")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
					backr = /obj.item/gwstrap
					r_hand = /obj/item/rogueweapon/spear
				if("Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/woodcut
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson
			pants = /obj/item/clothing/under/roguetown/trou
			gloves = /obj/item/clothing/gloves/roguetown/leather
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			shoes = /obj/item/clothing/shoes/roguetown/boots
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)

		if("Duelist")
			to_chat(H, span_warning(" A thrill seeking swordsmen who foregoes armor in exchange for a more nimble fighting style."))
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			H.set_blindness(0)
			H.cmode_music = 'sound/music/combat_duelist.ogg'
			var/weapons = list("Sabre","Dagger")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Sabre")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/sabre
				if("Dagger")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
					beltr = /obj/item/rogueweapon/huntingknife/idagger
					beltl = /obj/item/rogueweapon/huntingknife/idagger
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			head = /obj/item/clothing/head/roguetown/brimmed
			armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/tanned
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/valorian
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1,/obj/item/storage/belt/rogue/pouch/coins/poor)
                
		if("Barbarian")
			to_chat(H, span_warning("You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling."))
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_rhaenvalian.ogg'
			H.set_blindness(0)
			var/weapons = list("Katar","Axe","MY BARE HANDS!!!")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if ("Katar")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					beltr = /obj/item/rogueweapon/katar
				if("Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/boneaxe
				if ("MY BARE HANDS!!!")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			H.change_stat("strength", 3)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", -2)
			H.change_stat("speed", -3)
			if(H.pronouns == HE_HIM || H.pronouns == THEY_THEM || H.pronouns == IT_ITS)
				H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
				head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				beltl = /obj/item/rogueweapon/huntingknife
			if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
				head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
				armor = /obj/item/clothing/suit/roguetown/armor/leather/bikini
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shorts
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				beltl = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)

		