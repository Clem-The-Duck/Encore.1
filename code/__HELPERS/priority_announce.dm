/proc/priority_announce(text, title = "", sound, type , sender_override)
	if(!text)
		return

	var/announcement

	if (title && length(title) > 0)
		announcement += "<span class='big bold'>[title]</span>"
//		GLOB.news_network.SubmitArticle(text, "Captain's Announcement", "Station Announcements", null)
/*
	else
		if(!sender_override)
			announcement += "<h1 class='alert'>[command_name()] Update</h1>"
		else
			announcement += "<h1 class='alert'>[sender_override]</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>[html_encode(title)]</h2>"

		if(!sender_override)
			if(title == "")
				GLOB.news_network.SubmitArticle(text, "", "Station Announcements", null)
			else
				GLOB.news_network.SubmitArticle(title + "<br><br>" + text, "", "Station Announcements", null)
*/
	announcement += "<br><span class='alert'>[STRIP_HTML_SIMPLE(text, MAX_MESSAGE_LEN)]</span>"
//	announcement += "<br>"

	var/s = sound(sound)
	for(var/mob/M in GLOB.player_list)
		if(M.can_hear())
			to_chat(M, announcement)
			if(M.client.prefs.toggles & SOUND_ANNOUNCEMENTS)
				if(sound)
					M.playsound_local(M, s, 100)

/proc/print_command_report(text = "", title = null, announce=TRUE)
	if(announce)
		priority_announce("A missive has been sent to the keep.", title, 'sound/misc/bell.ogg')

	var/datum/comm_message/M  = new /datum/comm_message
	if(!title)
		title = "Classified Missive"
	M.title = title
	M.content =  text

	SScommunications.send_message(M)

/proc/minor_announce(message, title = "", alert)
	if(!message)
		return

	for(var/mob/M in GLOB.player_list)
		if(M.can_hear())
			to_chat(M, "<span class='big bold'><font color = purple>[html_encode(title)]</font color><BR>[html_encode(message)]</span><BR>")
			if(M.client.prefs.toggles & SOUND_ANNOUNCEMENTS)
				if(alert)
					M.playsound_local(M, 'sound/misc/alert.ogg', 100)
				else
					M.playsound_local(M, 'sound/misc/alert.ogg', 100)
