/obj/effect/proc_holder/spell/targeted/rod_form
	name = "Rod Form"
	desc = ""
	human_req = FALSE
	charge_max = 250
	cooldown_min = 100
	range = -1
	include_user = TRUE
	invocation = "CLANG!"
	invocation_type = "shout"
	action_icon_state = "immrod"

/obj/effect/proc_holder/spell/targeted/rod_form/cast(list/targets,mob/user = usr)
	var/area/A = get_area(user)
	if(istype(A, /area/wizard_station))
		to_chat(user, span_warning("I know better than to trash Wizard Federation property. Best wait until you leave to use [src]."))
		return
	for(var/mob/living/M in targets)
		var/turf/start = get_turf(M)
		var/obj/effect/immovablerod/wizard/W = new(start, get_ranged_target_turf(start, M.dir, (15 + spell_level * 3)))
		W.wizard = M
		W.max_distance += spell_level * 3 //You travel farther when you upgrade the spell
		W.damage_bonus += spell_level * 20 //You do more damage when you upgrade the spell
		W.start_turf = start
		M.forceMove(W)
		M.notransform = TRUE
		M.status_flags |= GODMODE

//Wizard Version of the Immovable Rod

/obj/effect/immovablerod/wizard
	var/max_distance = 13
	var/damage_bonus = 0
	var/turf/start_turf
	notify = FALSE

/obj/effect/immovablerod/wizard/Move()
	if(get_dist(start_turf, get_turf(src)) >= max_distance)
		qdel(src)
	..()

/obj/effect/immovablerod/wizard/Destroy()
	if(wizard)
		wizard.status_flags &= ~GODMODE
		wizard.notransform = FALSE
		wizard.forceMove(get_turf(src))
	return ..()

/obj/effect/immovablerod/wizard/penetrate(mob/living/L)
	if(L.anti_magic_check())
		L.visible_message(span_danger("[src] hits [L], but it bounces back, then vanishes!") , span_danger("[src] hits you... but it bounces back, then vanishes!") , span_danger("I hear a weak, sad, CLANG."))
		qdel(src)
		return
	L.visible_message(span_danger("[L] is penetrated by an immovable rod!") , span_danger("The rod penetrates you!") , span_danger("I hear a CLANG!"))
	L.adjustBruteLoss(70 + damage_bonus)
