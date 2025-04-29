/datum/advclass/mercenary/vaquero
	name = "Vaquero"
	tutorial = "A Valorian subculture of fencing, bounty hunting charismatic nomads who are known for their skill in mounted combat and their flashy yet practical clothing."
	outfit = /datum/outfit/job/roguetown/mercenary/vaquero
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/saigabuck/tame/saddled
	cmode_music = 'sound/music/combat_vaquero.ogg'
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)

/datum/advclass/mercenary/vaquero/equipme(mob/living/carbon/human/H)
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	return ..()

/datum/outfit/job/roguetown/mercenary/vaquero/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
	head = /obj/item/clothing/head/roguetown/bardhat
	mouth = /obj/item/alch/rosa
	shoes = /obj/item/clothing/shoes/roguetown/ridingboots
	neck = /obj/item/clothing/neck/roguetown/leather
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather
	gloves = /obj/item/clothing/gloves/roguetown/otavan
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vaquerocoat
	cloak = /obj/item/clothing/cloak/half/rider/red
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/rapier/vaquero
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying/vaquero
	backr = /obj/item/rogue/instrument/guitar
	backpack_contents = list(
					/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
					/obj/item/rogueweapon/huntingknife/idagger/navaja = 1,
					/obj/item/lockpick = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/roguekey/mercenary = 1
					)
	H.change_stat("strength", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
