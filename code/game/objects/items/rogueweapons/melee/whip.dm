/datum/intent/whip/lash
	name = "lash"
	blade_class = BCLASS_CUT
	attack_verb = list("lashes", "cracks")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	chargetime = 0
	recovery = 7
	releasedrain = 4
	penfactor = 10
	reach = 2
	clickcd = 10
	icon_state = "inlash"
	item_d_type = "slash"

/datum/intent/whip/crack
	name = "crack"
	blade_class = BCLASS_CUT
	attack_verb = list("cracks", "strikes") //something something dwarf fotresss
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	chargetime = 0
	recovery = 10
	penfactor = 40
	reach = 3
	clickcd = 14
	releasedrain = 6
	icon_state = "incrack"
	item_d_type = "slash"

/datum/intent/whip/smash //how the fuck do you smash something with a whip.. flails exist for that
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("smashes", "slaps", "blunts")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	chargetime = 0
	recovery = 10
	penfactor = 20
	damfactor = 1.2
	reach = 2
	releasedrain = 8
	icon_state = "instrike"
	item_d_type = "blunt"

/datum/intent/whip/punish
	name = "punish"
	blade_class = BCLASS_CUT
	attack_verb = list("lashes")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	chargetime = 0
	recovery = 10
	damfactor = 0.3
	penfactor = 0
	releasedrain = 2
	reach = 2
	icon_state = "inpunish"
	item_d_type = "blunt"

/datum/intent/whip/punish/cackle
	name = "cackle"
	clickcd = 8
	misscost = -1
	releasedrain = 0

/obj/item/rogueweapon/whip
	force = 22
	possible_item_intents = list(/datum/intent/whip/crack, /datum/intent/whip/lash, /datum/intent/whip/punish)
	name = "whip"
	desc = "A leather whip. Built to last, with a sharp stone for a tip."
	icon_state = "whip"
	icon = 'icons/roguetown/weapons/32.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BELT
	associated_skill = /datum/skill/combat/whipsflails
	anvilrepair = /datum/skill/craft/tanning
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = WHIPWOOSH
	throwforce = 5
	wdefense = 0
	wbalance = 1
	minstr = 6
	grid_width = 32
	grid_height = 64

/obj/item/rogueweapon/whip/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -3,"nx" = 11,"ny" = -2,"wx" = -7,"wy" = -3,"ex" = 3,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 22,"sturn" = -23,"wturn" = -23,"eturn" = 29,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/whip/xylix
	name = "Cackle Lash"
	desc = "The chimes of this whip are said to sound as the trickster's laughter itself."
	icon_state = "xylixwhip"
	possible_item_intents = list(/datum/intent/whip/crack, /datum/intent/whip/lash, /datum/intent/whip/punish/cackle)
	force = 24
	wbalance = 1.5
	swingsound = list('sound/magic/webspin.ogg')

/obj/item/rogueweapon/whip/antique
	force = 28
	name = "Repenta En"
	desc = "An extremely well maintained whip, with a polished steel tip and gilded handle"
	minstr = 9
	icon_state = "gwhip"

/obj/item/rogueweapon/whip/spiderwhip
	force = 24
	name = "lashkiss whip"
	desc = "A dark whip with segmented, ashen spines for a base. Claimed to be hewn from dendrified prisoners of terror."
	icon_state = "spiderwhip"
	minstr = 6


/obj/item/rogueweapon/whip/antique/psywhip
	name = "Daybreak"
	desc = "I am wrath. I am silver. I am the mercy of HIM."
	icon_state = "psywhip"
	is_silver = TRUE

/obj/item/rogueweapon/whip/psywhip_lesser
	name = "psydonite whip"
	desc = "An ornate whip, plated in a ceremonial veneer of silver. Crack the leather and watch as the apostates clammer aside."
	icon_state = "psywhip_lesser"

/obj/item/rogueweapon/whip/psywhip_lesser/ComponentInitialize()
	. = ..()					//+3 force, +50 int, +1 def, make silver
	AddComponent(/datum/component/psyblessed, FALSE, 3, FALSE, 50, 1, TRUE)
