/datum/advclass/iconoclast //Support Cleric, Heavy armor, unarmed, miracles.
	name = "Iconoclast"
	tutorial = "Trained by an ecclesial sect, you uphold the creed of a disruptive God somewhere far away. Make little of the Katholikos' grandeur and empower those who suffer at their hands."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/bandit/iconoclast
	category_tags = list(CTAG_BANDIT)
	maximum_possible_slots = 1 // We only want one of these.
	cmode_music = 'sound/music/Iconoclast.ogg'

/datum/outfit/job/roguetown/bandit/iconoclast/pre_equip(mob/living/carbon/human/H)
	..()
	H.set_patron(/datum/patron/heretic/otherkind) // we gotta be a matthian before the devotion stuff starts
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) // Poles or maces if we're a wimp and don't want to engage with unarmed. Not ideal.
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)  // Unarmed if we want to kick ass for the lord(you do, this is what you SHOULD DO!!)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE) // We can substitute for a sawbones, but aren't as good and dont have access to surgical tools
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE) //We are the True Mathlete
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	r_hand = /obj/item/rogueweapon/woodstaff
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/needle/thorn = 1, /obj/item/natural/cloth = 1)
	head = /obj/item/clothing/head/roguetown/roguehood
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron
	beltr = /obj/item/rogueweapon/katar
	id = /obj/item/mattcoin
	H.change_stat("strength", 3) // LETS WRASSLE
	H.change_stat("endurance", 3) // This is our Go Big stat, we want lots of stamina for miracles and WRASSLIN.
	H.change_stat("constitution", 1)
	H.change_stat("fortune", 2) //We have a total of +12 in stats. 
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC) // We are going to be the lord's first heavy armor unarmed class

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_monk(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
