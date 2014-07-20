/mob/living/carbon
	var/vorifice = "Oral Vore"

/mob/living/carbon/human/proc/endo_toggle()
	set name = "Toggle Stomach Digestion"
	set category = "Lewd"

	if(stendo == 0)
		stendo = 1
		src << "<span class='notice'>You will no longer digest people in your stomach.</span>"
	else
		stendo = 0
		src << "<span class='notice'>You will now digest people in your stomach.</span>"

/mob/living/carbon/human/proc/cvendo_toggle()
	set name = "Toggle CV Digestion"
	set category = "Lewd"

	if(cvendo == 0)
		cvendo = 1
		src << "<span class='notice'>You will no longer cummify people.</span>"
	else
		cvendo = 0
		src << "<span class='notice'>You will now cummify people.</span>"

/mob/living/carbon/human/proc/bvendo_toggle()
	set name = "Toggle BV Digestion"
	set category = "Lewd"

	if(bvendo == 0)
		bvendo = 1
		src << "<span class='notice'>You will no longer milkify people.</span>"
	else
		bvendo = 0
		src << "<span class='notice'>You will now milkify people.</span>"

/mob/living/carbon/human/proc/womb_toggle()
	set name = "Womb Mode"
	set category = "Lewd"
	wombheal = input("Womb Mode") in list("Hold","Heal","Transform (Male)","Transform (Female)","Transform (Keep Gender)","Digest")
	if(wombheal == "Heal")
		src << "<span class='notice'>You will now heal people you've unbirthed.</span>"
	if(wombheal == "Digest")
		src << "<span class='notice'>You will now digest people you've unbirthed.</span>"
	if(wombheal == "Hold")
		src << "<span class='notice'>You will now harmlessly hold people you've unbirthed.</span>"
	if(wombheal == "Transform (Male)")
		src << "<span class='notice'>You will now transform people you've unbirthed into your son.</span>"
	if(wombheal == "Transform (Female)")
		src << "<span class='notice'>You will now transform people you've unbirthed into your daughter.</span>"
	if(wombheal == "Transform (Keep Gender)")
		src << "<span class='notice'>You will now transform people you've unbirthed, but they will keep their gender.</span>"

/mob/living/carbon/human/proc/orifice_toggle()
	set name = "Choose Vore Mode"
	set category = "Lewd"
	vorifice = input("Choose Vore Mode") in list("Oral Vore","Unbirth","Anal Vore","Cock Vore","Breast Vore")
	if(vorifice == "Oral Vore")
		src << "<span class='notice'>You will now send consumed people into your stomach via mouth.</span>"
	if(vorifice == "Unbirth")
		if (gender == FEMALE)
			src << "<span class='notice'>You will now send consumed people into your womb.</span>"
		else
			vorifice = "Oral Vore"
			src << "<span class='notice'>You lack a womb! Setting to Oral Vore instead.</span>"
	if(vorifice == "Anal Vore")
		src << "<span class='notice'>You will now send consumed people into your stomach via butt.</span>"
	if(vorifice == "Cock Vore")
		if (gender == MALE)
			src << "<span class='notice'>You will now send consumed people into your cock.</span>"
		else
			vorifice = "Oral Vore"
			src << "<span class='notice'>You lack a cock! Setting to Oral Vore instead.</span>"
	if(vorifice == "Breast Vore")
		if (gender == FEMALE)
			src << "<span class='notice'>You will now send consumed people into your breasts.</span>"
		else
			vorifice = "Oral Vore"
			src << "<span class='notice'>You lack breasts! Setting to Oral Vore instead.</span>"


/mob/living/carbon/human/proc/vore_release()
	set name = "Release"
	set category = "Lewd"
	var/releaseorifice = input("Choose Orifice") in list("Stomach (by Mouth)","Stomach (by Anus)","Womb","Cock","Breasts")
	if(releaseorifice == "Stomach (by Mouth)")
		if(stomach_contents.len)
			for(var/mob/M in src)
				if(M in stomach_contents)
					stomach_contents.Remove(M)
					for (var/mob/living/carbon/R in hearers(src.loc, null))
						if(src in R.stomach_contents)
							M.loc = R.stomach_contents
						else
							M.loc = loc
				//Paralyse(10)
			src.visible_message("\green <B>[src] hurls out the contents of their stomach!</B>")
			playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		return
	if(releaseorifice == "Stomach (by Anus)")
		if(stomach_contents.len)
			for(var/mob/M in src)
				if(M in stomach_contents)
					stomach_contents.Remove(M)
					for (var/mob/living/carbon/R in hearers(src.loc, null))
						if(src in R.stomach_contents)
							M.loc = R.stomach_contents
						else
							M.loc = loc
					//Paralyse(10)
			src.visible_message("\green <B>[src] releases their stomach contents out of their rear!</B>")
			playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		return
	if(releaseorifice == "Womb")
		if(womb_contents.len)
			for(var/mob/M in src)
				if(M in womb_contents)
					womb_contents.Remove(M)
					for (var/mob/living/carbon/R in hearers(src.loc, null))
						if(src in R.womb_contents)
							M.loc = R.womb_contents
						else
							M.loc = loc
					//Paralyse(10)
			src.visible_message("\green <B>[src] gushes out the contents of their womb!</B>")
			playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		else
			if(src.wombfull == 1)
				wombfull = 0
				src.visible_message("\red <B>[src] gushes out a puddle of liquid from between their legs!</B>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		return
	if(releaseorifice == "Cock")
		if(cock_contents.len)
			for(var/mob/M in src)
				if(M in cock_contents)
					cock_contents.Remove(M)
					for (var/mob/living/carbon/R in hearers(src.loc, null))
						if(src in R.cock_contents)
							M.loc = R.cock_contents
						else
							M.loc = loc
					//Paralyse(10)
			src.visible_message("\green <B>[src] splurts out the contents of their cock!</B>")
			playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		else
			if(src.cockfull == 1)
				cockfull = 0
				src.visible_message("\red <B>[src] gushes out a puddle of cum from their cock!</B>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		return

	if(releaseorifice == "Breasts")
		if(boob_contents.len)
			for(var/mob/M in src)
				if(M in boob_contents)
					boob_contents.Remove(M)
					for (var/mob/living/carbon/R in hearers(src.loc, null))
						if(src in R.boob_contents)
							M.loc = R.boob_contents
						else
							M.loc = loc
					//Paralyse(10)
				src.visible_message("\green <B>[src] squirts out the contents of their breasts!</B>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		else
			if(src.boobfull == 1)
				boobfull = 0
				src.visible_message("\red <B>[src] squirts out a puddle of milk from their breasts!</B>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		return

