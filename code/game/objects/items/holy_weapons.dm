// CHAPLAIN CUSTOM ARMORS //

/obj/item/clothing/head/helmet/chaplain
	name = "crusader helmet"
	desc = ""
	icon_state = "knight_templar"
	item_state = "knight_templar"
	armor = list("blunt" = 50, "slash" = 30, "stab" = 20, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/suit/armor/riot/chaplain
	name = "crusader armour"
	desc = ""
	icon_state = "knight_templar"
	item_state = "knight_templar"
	allowed = list(/obj/item/storage/book/bible, /obj/item/nullrod, /obj/item/reagent_containers/food/drinks/bottle/holywater, /obj/item/storage/fancy/candle_box, /obj/item/candle, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	slowdown = 0
	clothing_flags = NONE

/obj/item/choice_beacon/holy
	name = "armaments beacon"
	desc = ""

/obj/item/choice_beacon/holy/canUseBeacon(mob/living/user)
	if(user.mind && user.mind.isholy)
		return ..()
	else
		playsound(src, 'sound/blank.ogg', 40, TRUE)
		return FALSE

/obj/item/choice_beacon/holy/generate_display_names()
	var/static/list/holy_item_list
	if(!holy_item_list)
		holy_item_list = list()
		var/list/templist = typesof(/obj/item/storage/box/holy)
		for(var/V in templist)
			var/atom/A = V
			holy_item_list[initial(A.name)] = A
	return holy_item_list

/obj/item/choice_beacon/holy/spawn_option(obj/choice,mob/living/M)
	if(!GLOB.holy_armor_type)
		..()
		playsound(src, 'sound/blank.ogg', 40, TRUE)
		SSblackbox.record_feedback("tally", "chaplain_armor", 1, "[choice]")
		GLOB.holy_armor_type = choice
	else
		to_chat(M, span_warning("A selection has already been made. Self-Destructing..."))
		return


/obj/item/storage/box/holy
	name = "Templar Kit"

/obj/item/storage/box/holy/PopulateContents()
	new /obj/item/clothing/head/helmet/chaplain(src)
	new /obj/item/clothing/suit/armor/riot/chaplain(src)

/obj/item/storage/box/holy/student
	name = "Profane Scholar Kit"

/obj/item/storage/box/holy/student/PopulateContents()
	new /obj/item/clothing/suit/armor/riot/chaplain/studentuni(src)
	new /obj/item/clothing/head/helmet/chaplain/cage(src)

/obj/item/clothing/suit/armor/riot/chaplain/studentuni
	name = "student robe"
	desc = ""
	icon_state = "studentuni"
	item_state = "studentuni"
	body_parts_covered = ARMS|CHEST
	allowed = list(/obj/item/storage/book/bible, /obj/item/nullrod, /obj/item/reagent_containers/food/drinks/bottle/holywater, /obj/item/storage/fancy/candle_box, /obj/item/candle, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)

/obj/item/clothing/head/helmet/chaplain/cage
	name = "cage"
	desc = ""
	flags_inv = HIDEHAIR //bald
	mob_overlay_icon = 'icons/mob/large-worn-icons/64x64/head.dmi'
	icon_state = "cage"
	item_state = "cage"
	worn_x_dimension = 64
	worn_y_dimension = 64
	dynamic_hair_suffix = ""

/obj/item/storage/box/holy/sentinel
	name = "Stone Sentinel Kit"

/obj/item/storage/box/holy/sentinel/PopulateContents()
	new /obj/item/clothing/suit/armor/riot/chaplain/ancient(src)
	new /obj/item/clothing/head/helmet/chaplain/ancient(src)

/obj/item/clothing/head/helmet/chaplain/ancient
	name = "ancient helmet"
	desc = ""
	icon_state = "knight_ancient"
	item_state = "knight_ancient"

/obj/item/clothing/suit/armor/riot/chaplain/ancient
	name = "ancient armour"
	desc = ""
	icon_state = "knight_ancient"
	item_state = "knight_ancient"

/obj/item/storage/box/holy/witchhunter
	name = "Witchhunter Kit"

/obj/item/storage/box/holy/witchhunter/PopulateContents()
	new /obj/item/clothing/suit/armor/riot/chaplain/witchhunter(src)
	new /obj/item/clothing/head/helmet/chaplain/witchunter_hat(src)

/obj/item/clothing/suit/armor/riot/chaplain/witchhunter
	name = "witchunter garb"
	desc = ""
	icon_state = "witchhunter"
	item_state = "witchhunter"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/head/helmet/chaplain/witchunter_hat
	name = "witchunter hat"
	desc = ""
	icon_state = "witchhunterhat"
	item_state = "witchhunterhat"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEEYES|HIDEHAIR

/obj/item/storage/box/holy/adept
	name = "Divine Adept Kit"

/obj/item/storage/box/holy/adept/PopulateContents()
	new /obj/item/clothing/suit/armor/riot/chaplain/adept(src)
	new /obj/item/clothing/head/helmet/chaplain/adept(src)

/obj/item/clothing/head/helmet/chaplain/adept
	name = "adept hood"
	desc = ""
	icon_state = "crusader"
	item_state = "crusader"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS

/obj/item/clothing/suit/armor/riot/chaplain/adept
	name = "adept robes"
	desc = ""
	icon_state = "crusader"
	item_state = "crusader"

/obj/item/storage/box/holy/follower
	name = "Followers of the Chaplain Kit"

/obj/item/storage/box/holy/follower/PopulateContents()
	new /obj/item/clothing/suit/hooded/chaplain_hoodie/leader(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie(src)

/obj/item/clothing/suit/hooded/chaplain_hoodie
	name = "follower hoodie"
	desc = ""
	icon_state = "chaplain_hoodie"
	item_state = "chaplain_hoodie"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	allowed = list(/obj/item/storage/book/bible, /obj/item/nullrod, /obj/item/reagent_containers/food/drinks/bottle/holywater, /obj/item/storage/fancy/candle_box, /obj/item/candle, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	hoodtype = /obj/item/clothing/head/hooded/chaplain_hood

/obj/item/clothing/head/hooded/chaplain_hood
	name = "follower hood"
	desc = ""
	icon_state = "chaplain_hood"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS

/obj/item/clothing/suit/hooded/chaplain_hoodie/leader
	name = "leader hoodie"
	desc = ""
	icon_state = "chaplain_hoodie_leader"
	item_state = "chaplain_hoodie_leader"
	hoodtype = /obj/item/clothing/head/hooded/chaplain_hood/leader

/obj/item/clothing/head/hooded/chaplain_hood/leader
	name = "leader hood"
	desc = ""
	icon_state = "chaplain_hood_leader"


// CHAPLAIN NULLROD AND CUSTOM WEAPONS //

/obj/item/nullrod
	name = "null rod"
	desc = ""
	icon_state = "nullrod"
	item_state = "nullrod"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 18
	throw_speed = 1
	throw_range = 4
	throwforce = 10
	w_class = WEIGHT_CLASS_TINY
	obj_flags = UNIQUE_RENAME
	var/reskinned = FALSE
	var/chaplain_spawnable = TRUE

/obj/item/nullrod/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, TRUE, FALSE, null, null, FALSE)

/obj/item/nullrod/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] is killing [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to get closer to god!"))
	return (BRUTELOSS|FIRELOSS)

/obj/item/nullrod/attack_self(mob/user)
	if(user.mind && (user.mind.isholy) && !reskinned)
		reskin_holy_weapon(user)

/obj/item/nullrod/proc/reskin_holy_weapon(mob/M)
	if(GLOB.holy_weapon_type)
		return
	var/obj/item/nullrod/holy_weapon
	var/list/holy_weapons_list = typesof(/obj/item/nullrod)
	var/list/display_names = list()
	for(var/V in holy_weapons_list)
		var/obj/item/nullrod/rodtype = V
		if (initial(rodtype.chaplain_spawnable))
			display_names[initial(rodtype.name)] = rodtype

	var/choice = input(M,"What theme would you like for my holy weapon?","Holy Weapon Theme") as null|anything in sortList(display_names, GLOBAL_PROC_REF(cmp_typepaths_asc))
	if(QDELETED(src) || !choice || M.stat || !in_range(M, src) || M.incapacitated() || reskinned)
		return

	var/A = display_names[choice] // This needs to be on a separate var as list member access is not allowed for new
	holy_weapon = new A

	GLOB.holy_weapon_type = holy_weapon.type

	SSblackbox.record_feedback("tally", "chaplain_weapon", 1, "[choice]")

	if(holy_weapon)
		holy_weapon.reskinned = TRUE
		qdel(src)
		M.put_in_active_hand(holy_weapon)

/obj/item/nullrod/godhand
	icon_state = "disintegrate"
	item_state = "disintegrate"
	lefthand_file = 'icons/mob/inhands/misc/touchspell_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/touchspell_righthand.dmi'
	name = "god hand"
	desc = ""
	item_flags = ABSTRACT | DROPDEL
	w_class = WEIGHT_CLASS_HUGE
	hitsound = list('sound/blank.ogg')
	damtype = BURN
	attack_verb = list("punched", "cross countered", "pummeled")

/obj/item/nullrod/godhand/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)

/obj/item/nullrod/staff
	icon_state = "godstaff-red"
	item_state = "godstaff-red"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	name = "red holy staff"
	desc = ""
	w_class = WEIGHT_CLASS_HUGE
	force = 5
	slot_flags = ITEM_SLOT_BACK
	block_chance = 50
	var/shield_icon = "shield-red"

/obj/item/nullrod/staff/worn_overlays(isinhands)
	. = list()
	if(isinhands)
		. += mutable_appearance('icons/effects/effects.dmi', shield_icon, MOB_LAYER + 0.01)

/obj/item/nullrod/staff/blue
	name = "blue holy staff"
	icon_state = "godstaff-blue"
	item_state = "godstaff-blue"
	shield_icon = "shield-old"

/obj/item/nullrod/claymore
	icon_state = "claymore"
	item_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "holy claymore"
	desc = ""
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	block_chance = 30
	sharpness = IS_SHARP
	hitsound = list('sound/blank.ogg')
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/claymore/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		final_block_chance = 0 //Don't bring a sword to a gunfight
	return ..()

/obj/item/nullrod/claymore/darkblade
	icon_state = "cultblade"
	item_state = "cultblade"
	lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	name = "dark blade"
	desc = ""
	slot_flags = ITEM_SLOT_BELT
	hitsound = list('sound/blank.ogg')

/obj/item/nullrod/claymore/chainsaw_sword
	icon_state = "chainswordon"
	item_state = "chainswordon"
	name = "sacred chainsaw sword"
	desc = ""
	slot_flags = ITEM_SLOT_BELT
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = list('sound/blank.ogg')
	tool_behaviour = TOOL_SAW
	toolspeed = 1.5 //slower than a real saw

/obj/item/nullrod/claymore/glowing
	icon_state = "swordon"
	item_state = "swordon"
	name = "force weapon"
	desc = ""
	slot_flags = ITEM_SLOT_BELT

/obj/item/nullrod/claymore/katana
	name = "\improper Hanzo steel"
	desc = ""
	icon_state = "katana"
	item_state = "katana"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK

/obj/item/nullrod/claymore/multiverse
	name = "extradimensional blade"
	desc = ""
	icon_state = "multiverse"
	item_state = "multiverse"
	slot_flags = ITEM_SLOT_BELT

/obj/item/nullrod/claymore/multiverse/attack(mob/living/carbon/M, mob/living/carbon/user)
	force = rand(1, 30)
	..()

/obj/item/nullrod/claymore/saber
	name = "light energy sword"
	hitsound = 'sound/blank.ogg'
	icon = 'icons/obj/transforming_energy.dmi'
	icon_state = "swordblue"
	item_state = "swordblue"
	desc = ""
	slot_flags = ITEM_SLOT_BELT

/obj/item/nullrod/claymore/saber/red
	name = "dark energy sword"
	icon_state = "swordred"
	item_state = "swordred"
	desc = ""

/obj/item/nullrod/claymore/saber/pirate
	name = "nautical energy sword"
	icon_state = "cutlass1"
	item_state = "cutlass1"
	desc = ""

/obj/item/nullrod/sord
	name = "\improper UNREAL SORD"
	desc = ""
	icon_state = "sord"
	item_state = "sord"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 4.13
	throwforce = 1
	hitsound = 'sound/blank.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/scythe
	icon_state = "scythe1"
	item_state = "scythe1"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "reaper scythe"
	desc = ""
	w_class = WEIGHT_CLASS_BULKY
	armor_penetration = 35
	slot_flags = ITEM_SLOT_BACK
	sharpness = IS_SHARP
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/nullrod/scythe/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 70, 110) //the harvest gives a high bonus chance

/obj/item/nullrod/scythe/vibro
	icon_state = "hfrequency0"
	item_state = "hfrequency1"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "high frequency blade"
	desc = ""
	attack_verb = list("chopped", "sliced", "cut", "zandatsu'd")
	hitsound = 'sound/blank.ogg'

/obj/item/nullrod/scythe/spellblade
	icon_state = "spellblade"
	item_state = "spellblade"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	icon = 'icons/obj/guns/magic.dmi'
	name = "dormant spellblade"
	desc = ""
	hitsound = 'sound/blank.ogg'

/obj/item/nullrod/scythe/talking
	icon_state = "talking_sword"
	item_state = "talking_sword"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "possessed blade"
	desc = ""
	attack_verb = list("chopped", "sliced", "cut")
	hitsound = 'sound/blank.ogg'
	var/possessed = FALSE

/obj/item/nullrod/scythe/talking/relaymove(mob/user)
	return //stops buckled message spam for the ghost.

/obj/item/nullrod/scythe/talking/attack_self(mob/living/user)
	if(possessed)
		return

	to_chat(user, span_notice("I attempt to wake the spirit of the blade..."))

	possessed = TRUE

	var/list/mob/candidates = pollGhostCandidates("Do you want to play as the spirit of [user.real_name]'s blade?", ROLE_PAI, null, FALSE, 100, POLL_IGNORE_POSSESSED_BLADE)

	if(LAZYLEN(candidates))
		var/mob/dead/observer/C = pick(candidates)
		var/mob/living/simple_animal/shade/S = new(src)
		S.ckey = C.ckey
		S.fully_replace_character_name(null, "The spirit of [name]")
		S.status_flags |= GODMODE
		S.language_holder = user.language_holder.copy(S)
		var/input = sanitize_name(stripped_input(S,"What are you named?", ,"", MAX_NAME_LEN))

		if(src && input)
			name = input
			S.fully_replace_character_name(null, "The spirit of [input]")
	else
		to_chat(user, span_warning("The blade is dormant. Maybe you can try again later."))
		possessed = FALSE

/obj/item/nullrod/scythe/talking/Destroy()
	for(var/mob/living/simple_animal/shade/S in contents)
		to_chat(S, span_danger("I were destroyed!"))
		qdel(S)
	return ..()

/obj/item/nullrod/scythe/talking/chainsword
	icon_state = "chainswordon"
	item_state = "chainswordon"
	name = "possessed chainsaw sword"
	desc = ""
	chaplain_spawnable = FALSE
	force = 30
	slot_flags = ITEM_SLOT_BELT
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = 'sound/blank.ogg'
	tool_behaviour = TOOL_SAW
	toolspeed = 0.5 //faster than normal saw

/obj/item/nullrod/hammmer
	icon_state = "hammeron"
	item_state = "hammeron"
	lefthand_file = 'icons/mob/inhands/weapons/hammers_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/hammers_righthand.dmi'
	name = "relic war hammer"
	desc = ""
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_HUGE
	attack_verb = list("smashed", "bashed", "hammered", "crunched")

/obj/item/nullrod/chainsaw
	name = "chainsaw hand"
	desc = ""
	icon_state = "chainsaw_on"
	item_state = "mounted_chainsaw"
	lefthand_file = 'icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	item_flags = ABSTRACT
	sharpness = IS_SHARP
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = 'sound/blank.ogg'
	tool_behaviour = TOOL_SAW
	toolspeed = 2 //slower than a real saw

/obj/item/nullrod/chainsaw/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)
	AddComponent(/datum/component/butchering, 30, 100, 0, hitsound)

/obj/item/nullrod/clown
	icon = 'icons/obj/wizard.dmi'
	icon_state = "clownrender"
	item_state = "render"
	name = "clown dagger"
	desc = ""
	hitsound = 'sound/blank.ogg'
	sharpness = IS_SHARP
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/pride_hammer
	icon_state = "pride"
	name = "Pride-struck Hammer"
	desc = ""
	force = 16
	throwforce = 15
	w_class = 4
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("attacked", "smashed", "crushed", "splattered", "cracked")
	hitsound = 'sound/blank.ogg'

/obj/item/nullrod/pride_hammer/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(prob(30) && ishuman(A))
		var/mob/living/carbon/human/H = A
		user.reagents.trans_to(H, user.reagents.total_volume, 1, 1, 0, transfered_by = user)
		to_chat(user, span_notice("My pride reflects on [H]."))
		to_chat(H, span_danger("I feel insecure, taking on [user]'s burden."))

/obj/item/nullrod/whip
	name = "holy whip"
	desc = ""
	icon_state = "chain"
	item_state = "chain"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	attack_verb = list("whipped", "lashed")
	hitsound = 'sound/blank.ogg'

/obj/item/nullrod/fedora
	name = "atheist's fedora"
	desc = ""
	icon_state = "fedora"
	item_state = "fedora"
	slot_flags = ITEM_SLOT_HEAD
	icon = 'icons/obj/clothing/hats.dmi'
	force = 0
	throw_speed = 4
	throw_range = 7
	throwforce = 30
	sharpness = IS_SHARP
	attack_verb = list("enlightened", "redpilled")

/obj/item/nullrod/armblade
	name = "dark blessing"
	desc = ""
	icon = 'icons/obj/changeling_items.dmi'
	icon_state = "arm_blade"
	item_state = "arm_blade"
	lefthand_file = 'icons/mob/inhands/antag/changeling_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/antag/changeling_righthand.dmi'
	item_flags = ABSTRACT
	w_class = WEIGHT_CLASS_HUGE
	sharpness = IS_SHARP

/obj/item/nullrod/armblade/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)
	AddComponent(/datum/component/butchering, 80, 70)

/obj/item/nullrod/armblade/tentacle
	name = "unholy blessing"
	icon_state = "tentacle"
	item_state = "tentacle"

/obj/item/nullrod/carp
	name = "carp-sie plushie"
	desc = ""
	icon = 'icons/obj/plushes.dmi'
	icon_state = "carpplush"
	item_state = "carp_plushie"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	force = 15
	attack_verb = list("bitten", "eaten", "fin slapped")
	hitsound = 'sound/blank.ogg'
	var/used_blessing = FALSE

/obj/item/nullrod/carp/attack_self(mob/living/user)
	if(used_blessing)
	else if(user.mind && (user.mind.isholy))
		to_chat(user, span_boldnotice("I am blessed by Carp-Sie. Wild space carp will no longer attack you."))
		user.faction |= "carp"
		used_blessing = TRUE

/obj/item/nullrod/claymore/bostaff //May as well make it a "claymore" and inherit the blocking
	name = "monk's staff"
	desc = ""
	w_class = WEIGHT_CLASS_BULKY
	force = 15
	block_chance = 40
	slot_flags = ITEM_SLOT_BACK
	sharpness = IS_BLUNT
	hitsound = "swing_hit"
	attack_verb = list("smashed", "slammed", "whacked", "thwacked")
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "bostaff0"
	item_state = "bostaff0"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'

/obj/item/nullrod/tribal_knife
	icon_state = "crysknife"
	item_state = "crysknife"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "arrhythmic knife"
	w_class = WEIGHT_CLASS_HUGE
	desc = ""
	sharpness = IS_SHARP
	slot_flags = null
	hitsound = 'sound/blank.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	item_flags = SLOWS_WHILE_IN_HAND

/obj/item/nullrod/tribal_knife/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	AddComponent(/datum/component/butchering, 50, 100)

/obj/item/nullrod/tribal_knife/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/nullrod/tribal_knife/process()
	slowdown = rand(-2, 2)


/obj/item/nullrod/pitchfork
	icon_state = "pitchfork0"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "unholy pitchfork"
	w_class = WEIGHT_CLASS_NORMAL
	desc = ""
	attack_verb = list("poked", "impaled", "pierced", "jabbed")
	hitsound = 'sound/blank.ogg'
	sharpness = IS_SHARP

/obj/item/nullrod/egyptian
	name = "egyptian staff"
	desc = ""
	icon = 'icons/obj/guns/magic.dmi'
	icon_state = "pharoah_sceptre"
	item_state = "pharoah_sceptre"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("bashes", "smacks", "whacks")

/obj/item/nullrod/hypertool
	icon = 'icons/obj/device.dmi'
	icon_state = "hypertool"
	item_state = "hypertool"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	name = "hypertool"
	desc = ""
	armor_penetration = 35
	damtype = BRAIN
	attack_verb = list("pulsed", "mended", "cut")
	hitsound = 'sound/blank.ogg'

/obj/item/nullrod/spear
	name = "ancient spear"
	desc = ""
	icon_state = "ratvarian_spear"
	item_state = "ratvarian_spear"
	lefthand_file = 'icons/mob/inhands/antag/clockwork_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/antag/clockwork_righthand.dmi'
	icon = 'icons/obj/clockwork_objects.dmi'
	slot_flags = ITEM_SLOT_BELT
	armor_penetration = 10
	sharpness = IS_SHARP_ACCURATE
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("stabbed", "poked", "slashed", "clocked")
	hitsound = 'sound/blank.ogg'
