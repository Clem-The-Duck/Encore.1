/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"
	max_integrity = 100

/obj/item/clothing/wrists/roguetown/bracers
	name = "steel bracers"
	desc = ""
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	max_integrity = 250
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/wrists/roguetown/bracers/iron
	name = "iron bracers"
	icon_state = "iron_bracers"
	item_state = "iron_bracers"
	max_integrity = 150
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = ""
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	max_integrity = 150
	anvilrepair = null
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/wrappings
	name = "solar wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "wrappings"
	item_state = "wrappings"
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "moon wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "nocwrappings"
	item_state = "nocwrappings"
	sewrepair = TRUE
