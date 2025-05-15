/obj/effect/proc_holder/spell/invoked/shepherd
	name = "Shepherd"
	range = 7
	overlay_state = "psy"
	releasedrain = 50
	chargedrain = 0
	chargetime = 0
	charge_max = 10 SECONDS
	sound = 'sound/magic/swap.ogg'
	associated_skill = /datum/skill/magic/holy
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokeholy
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/shepherd/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		var/turf/T = get_turf(target)
		var/turf/H = get_turf(user)
		if(T && H)
			playsound(T, 'sound/magic/swap.ogg', 100)
			user.forceMove(T)
			target.forceMove(H)
			return TRUE
	return FALSE

/obj/effect/proc_holder/spell/targeted/whisper
	name = "Whisper"
	range = 3 //what the fuck was I thinking making it a radius of 7
	overlay_state = "psygreater"
	releasedrain = 30
	charge_max = 30 SECONDS
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/psywhisper.ogg'
	associated_skill = /datum/skill/misc/reading
	ignore_cockblock = TRUE
	antimagic_allowed = TRUE
	invocation_type = "none" //it works

/obj/effect/proc_holder/spell/targeted/whisper/cast(list/targets,mob/living/user = usr)
	playsound(usr, 'sound/magic/psywhisper.ogg', 80, TRUE, soundping = FALSE)
	for(var/mob/living/L in targets)
		if(HAS_TRAIT(L, TRAIT_ARCYNE_T1) || HAS_TRAIT(L, TRAIT_ARCYNE_T2) || (HAS_TRAIT(L, TRAIT_ARCYNE_T3) || HAS_TRAIT(L, TRAIT_ARCYNE_T4)) || HAS_TRAIT(L, TRAIT_RITUALIST)) 
			L.Knockdown(20)
			L.visible_message(span_warning("[L] collapses, grasping their head"), span_userdanger("MY HEART IS EMPTY!!!"))
			L.apply_status_effect(/datum/status_effect/buff/whispered)
			L.Stun(50)
			return
		if(HAS_TRAIT(L, TRAIT_COMMIE) || HAS_TRAIT(L, TRAIT_CABAL) || (HAS_TRAIT(L, TRAIT_HORDE) || HAS_TRAIT(L, TRAIT_DEPRAVED)) || HAS_TRAIT(L, TRAIT_HERETIC_SEER)) 
			L.visible_message(span_warning("[L] shivers, but remains standing"), span_userdanger("THE WHISPERS OF THE DARK ONES GO SILENT"))
			playsound(L, 'sound/magic/fadingpresence.ogg', 100, FALSE)
			L.apply_status_effect(/datum/status_effect/buff/whispered)
			return
		else
			L.visible_message(span_warning("[L] shivers, but remains standing"), span_userdanger("That was extremely unsettling..")) 
			L.apply_status_effect(/datum/status_effect/buff/whispered)

/datum/status_effect/buff/whispered
	id = "whispered"
	alert_type = /atom/movable/screen/alert/status_effect/buff/whispered
	duration = 20 SECONDS
	effectedstats = list("perception" = -3)

/atom/movable/screen/alert/status_effect/buff/whispered
	name = "Silenced"
	desc = "I FEEL HOLLOW, ALONE."
	icon_state = "debuff"
	color = "#570e0e" //codersprited

/datum/status_effect/buff/whispered/on_apply()
	. = ..()
	owner.overlay_fullscreen("silenced", /atom/movable/screen/fullscreen/brute, 4)
	owner.add_movespeed_modifier(MOVESPEED_ID_ADMIN_VAREDIT, update=TRUE, priority=100, multiplicative_slowdown=1, movetypes=GROUND)
	ADD_TRAIT(owner, TRAIT_SPELLCOCKBLOCK, MAGIC_TRAIT)

/datum/status_effect/buff/whispered/on_remove()
	. = ..()
	owner.clear_fullscreen("silenced")
	owner.remove_movespeed_modifier(MOVESPEED_ID_ADMIN_VAREDIT, TRUE)
	REMOVE_TRAIT(owner, TRAIT_SPELLCOCKBLOCK, MAGIC_TRAIT)
