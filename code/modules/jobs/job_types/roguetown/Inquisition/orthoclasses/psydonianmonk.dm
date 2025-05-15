/datum/advclass/psydonianbrawler // A shaman/brawler, but for the Inquisition
	name = "Warrior Monk"
	tutorial = "You are the fist of the Holy Inquisition. You serve as a militant under the local Inquisitor to forward the goals of the Valorian Orthodoxy. PSYDON Endures."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/psydonianbrawler
	category_tags = list(CTAG_INQUISITION)
	cmode_music = 'sound/music/templarofpsydonia.ogg'

/datum/outfit/job/roguetown/psydonianbrawler/pre_equip(mob/living/carbon/human/H)
	..()
	has_loadout = TRUE
	wrists = /obj/item/clothing/wrists/roguetown/wrappings
	cloak = /obj/item/clothing/cloak/psydontabard/alt
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	pants = /obj/item/clothing/under/roguetown/trou/valorian
	backl = /obj/item/storage/backpack/rogue/satchel/black
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	mask = /obj/item/clothing/mask/rogue/facemask/psydonmask
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	l_hand = /obj/item/rogueweapon/knuckles
	id = /obj/item/clothing/ring/silver
	backpack_contents = list(/obj/item/storage/keyring/orthodoxist = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", -2)
		
		ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC) //No weapons. Just beating them to death as God intended.
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) //Their entire purpose is to rip people apart with their hands. I don't think they'd be too preturbed to see someone lose a limb.
		ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC) //Virtually no armor. Just like the shaman merc.
		ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)

		H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
