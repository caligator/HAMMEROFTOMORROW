//Due to how large this one is it gets its own file
/*
Chaplain
*/
/datum/job/chaplain
	title = "Chaplain"
	flag = CHAPLAIN
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"

	default_pda = /obj/item/device/pda/chaplain

	access = list(access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	minimal_access = list(access_morgue, access_chapel_office, access_crematorium)
	assistant_access = list(access_chapel_office)

/datum/job/chaplain/proc/setupbiblespecifics(var/obj/item/weapon/storage/bible/B, var/mob/living/carbon/human/H)
	switch(B.icon_state)
		if("honk1","honk2")
			new /obj/item/weapon/grown/bananapeel(B)
			new /obj/item/weapon/grown/bananapeel(B)

			if(B.icon_state == "honk1")
				H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/clown_hat(H), slot_wear_mask)

		if("bible")
			for(var/area/chapel/main/A in world)
				for(var/turf/T in A.contents)
					if(T.icon_state == "carpetsymbol")
						T.dir = 2
		if("koran")
			for(var/area/chapel/main/A in world)
				for(var/turf/T in A.contents)
					if(T.icon_state == "carpetsymbol")
						T.dir = 4
		if("scientology")
			for(var/area/chapel/main/A in world)
				for(var/turf/T in A.contents)
					if(T.icon_state == "carpetsymbol")
						T.dir = 8
		if("athiest")
			for(var/area/chapel/main/A in world)
				for(var/turf/T in A.contents)
					if(T.icon_state == "carpetsymbol")
						T.dir = 10

/datum/job/chaplain/Topic(href, href_list)
	if(href_list["seticon"])
		var/iconi = text2num(href_list["seticon"])

		var/biblename = biblenames[iconi]
		var/obj/item/weapon/storage/bible/B = locate(href_list["bible"])

		B.icon_state = biblestates[iconi]
		B.item_state = bibleitemstates[iconi]

		//Set biblespecific chapels
		setupbiblespecifics(B, usr)

		usr.put_in_hands(B) // Update inhand icon

		feedback_set_details("religion_book","[biblename]")

		usr << browse(null, "window=editicon") // Close window

/datum/job/chaplain/equip_items(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chaplain(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)

	var/obj/item/weapon/storage/bible/B = new /obj/item/weapon/storage/bible/booze(H)
	spawn(0)
		var/religion_name = "Christianity"
		var/new_religion = copytext(sanitize(input(H, "You are the Chaplain. Would you like to change your religion? Default is Christianity, in SPACE.", "Name change", religion_name)),1,MAX_NAME_LEN)

		if (!new_religion)
			new_religion = religion_name

		switch(lowertext(new_religion))
			if("christianity")
				B.name = pick("The Holy Bible","The Dead Sea Scrolls")
			if("satanism")
				B.name = "The Unholy Bible"
			if("cthulu")
				B.name = "The Necronomicon"
			if("islam")
				B.name = "Quran"
			if("scientology")
				B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
			if("chaos")
				B.name = "The Book of Lorgar"
			if("imperium")
				B.name = "Uplifting Primer"
			if("toolboxia")
				B.name = "Toolbox Manifesto"
			if("homosexuality")
				B.name = "Guys Gone Wild"
			if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks")
				B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition")
				H.setBrainLoss(100) // starts off retarded as fuck
			if("science")
				B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
			else
				B.name = "The Holy Book of [new_religion]"
		feedback_set_details("religion_name","[new_religion]")

	spawn(1)
		var/deity_name = "Space Jesus"
		var/new_deity = copytext(sanitize(input(H, "Would you like to change your deity? Default is Space Jesus.", "Name change", deity_name)),1,MAX_NAME_LEN)

		if ((length(new_deity) == 0) || (new_deity == "Space Jesus") )
			new_deity = deity_name
		B.deity_name = new_deity

		feedback_set_details("religion_deity","[new_deity]")

		//Open bible selection
		var/dat = "<html><head><title>Pick Bible Style</title></head><body><center><h2>Pick a bible style</h2></center><table>"

		var/i
		for(i = 1, i < biblestates.len, i++)
			var/icon/bibleicon = icon('icons/obj/storage.dmi', biblestates[i])

			var/nicename = biblenames[i]
			H << browse_rsc(bibleicon, nicename)
			dat += {"<tr><td><img src="[nicename]"></td><td><a href="?src=\ref[src];seticon=[i];bible=\ref[B]">[nicename]</a></td></tr>"}

		dat += "</table></body></html>"

		H << browse(dat, "window=editicon;can_close=0;can_minimize=0;size=250x650")
