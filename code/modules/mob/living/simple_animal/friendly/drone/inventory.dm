
///////////////////
//DRONE INVENTORY//
///////////////////
//Drone inventory
//Drone hands


/mob/living/simple_animal/drone/doUnEquip(obj/item/I, force, newloc, no_move, invdrop = TRUE, silent = FALSE)
	if(..())
		update_inv_hands()
		if(I == head)
			head = null
			update_inv_head()
		if(I == internal_storage)
			internal_storage = null
			update_inv_internal_storage()
		return TRUE
	return FALSE


/mob/living/simple_animal/drone/can_equip(obj/item/I, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	switch(slot)
		if(SLOT_HEAD)
			if(head)
				return FALSE
			if(!((I.slot_flags & ITEM_SLOT_HEAD) || (I.slot_flags & ITEM_SLOT_MASK)))
				return FALSE
			return TRUE
		if(SLOT_GENERC_DEXTROUS_STORAGE)
			if(internal_storage)
				return FALSE
			return TRUE
	..()


/mob/living/simple_animal/drone/get_item_by_slot(slot_id)
	switch(slot_id)
		if(SLOT_HEAD)
			return head
		if(SLOT_GENERC_DEXTROUS_STORAGE)
			return internal_storage
	return ..()


/mob/living/simple_animal/drone/equip_to_slot(obj/item/I, slot)
	if(!slot)
		return
	if(!istype(I))
		return

	var/index = get_held_index_of_item(I)
	if(index)
		held_items[index] = null
	update_inv_hands()

	if(I.pulledby)
		I.pulledby.stop_pulling()

	I.screen_loc = null // will get moved if inventory is visible
	I.forceMove(src)
	I.layer = ABOVE_HUD_LAYER
	I.plane = ABOVE_HUD_PLANE

	switch(slot)
		if(SLOT_HEAD)
			head = I
			update_inv_head()
		if(SLOT_GENERC_DEXTROUS_STORAGE)
			internal_storage = I
			update_inv_internal_storage()
		else
			to_chat(src, span_danger("I am trying to equip this item to an unsupported inventory slot. Report this to a coder!"))
			return

	//Call back for item being equipped to drone
	I.equipped(src, slot)

/mob/living/simple_animal/drone/getBackSlot()
	return SLOT_GENERC_DEXTROUS_STORAGE

/mob/living/simple_animal/drone/getBeltSlot()
	return SLOT_GENERC_DEXTROUS_STORAGE
