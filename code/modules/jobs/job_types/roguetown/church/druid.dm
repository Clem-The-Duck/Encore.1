/datum/job/roguetown/druid
	title = "Druid"
	f_title = "Druidess"
	flag = DRUID
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 99//Uncapped basically
	spawn_positions = 99

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = list(/datum/patron/elemental/gani) // druids are gani-only
	outfit = /datum/outfit/job/roguetown/druid
	tutorial = "You have always been drawn to the wild, and the wild drawn to you. When your calling came, it was from Gani herself. Your patron claims dominion over all nature--promising bounties to those who act in Her name to bring balance to Her domain. The forest is the most comfortable place for you, toiling alongside soilsons and soilbrides...although sometimes what lies beyond the gates fills your soul with a feral yearning."

	display_order = JDO_DRUID
	give_bank_account = TRUE
	min_pq = -999
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid
	allowed_patrons = list(/datum/patron/elemental/gani)

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/ganimask
	wrists = /obj/item/clothing/neck/roguetown/psicross/gani
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/gani
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 5, TRUE) //Shapeshifting skill
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE) //Druids know the forest and when it has been disturbed
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE) //To help them defend themselves with parrying
		H.put_in_hands(new /obj/item/rogueweapon/woodstaff(H), TRUE) //To encourage them to wander the forests and to help defend themselves
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", -1)
		H.ambushable = FALSE

	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal) //All non-combat church roles get Miracle, plus Inquisitor
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/heal) //Druid is a Gani role, so it should automatically get Fortify
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
