/mob/living/carbon/human/movement_delay()
	if(!has_gravity(src))
		return -1	//It's hard to be slowed down in space by... anything
	else if(status_flags & GOTTAGOFAST)
		return -1

	. = 0
	var/health_deficiency = (100 - health + staminaloss)
	if(health_deficiency >= 40)
		. += (health_deficiency / 25)

	var/hungry = (500 - nutrition) / 5	//So overeat would be 100 and default level would be 80
	if(hungry >= 70)
		. += hungry / 50

	if(wear_suit)
		. += wear_suit.slowdown
	if(shoes)
		. += shoes.slowdown
	if(back)
		. += back.slowdown

	if(FAT in mutations)
		. += 1.5
	if(bodytemperature < 283.222)
		. += (283.222 - bodytemperature) / 10 * 1.75

	. += ..()
	. += config.human_delay

/mob/living/carbon/human/Process_Spacemove(var/check_drift = 0)
	//Can we act
	if(!canmove)	return 0

	//Do we have a working jetpack
	if(istype(back, /obj/item/weapon/tank/jetpack))
		var/obj/item/weapon/tank/jetpack/J = back
		if(((!check_drift) || (check_drift && J.stabilization_on)) && (!lying) && (J.allow_thrust(0.01, src)))
			inertia_dir = 0
			return 1
	//Do we have working magboots
	if(istype(shoes, /obj/item/clothing/shoes/magboots))
		var/obj/item/clothing/shoes/magboots/B = shoes
		if((B.flags & NOSLIP) && istype(src.loc,/turf/simulated/floor) && (!has_gravity(src.loc)))
			return 1
	//If no working jetpack or magboots then use the other checks
	if(..())	return 1
	return 0


/mob/living/carbon/human/Process_Spaceslipping(var/prob_slip = 5)
	//If knocked out we might just hit it and stop.  This makes it possible to get dead bodies and such.
	if(stat)
		prob_slip = 0 // Changing this to zero to make it line up with the comment, and also, make more sense.

	//Do we have magboots or such on if so no slip
	if(istype(shoes, /obj/item/clothing/shoes/magboots) && (shoes.flags & NOSLIP))
		prob_slip = 0

	//Check hands and mod slip
	if(!l_hand)	prob_slip -= 2
	else if(l_hand.w_class <= 2)	prob_slip -= 1
	if (!r_hand)	prob_slip -= 2
	else if(r_hand.w_class <= 2)	prob_slip -= 1

	prob_slip = round(prob_slip)
	return(prob_slip)


/mob/living/carbon/human/slip(var/s_amount, var/w_amount, var/obj/O, var/lube)
	if(isobj(shoes) && (shoes.flags&NOSLIP) && !(lube&GALOSHES_DONT_HELP))
		return 0
	.=..()

/mob/living/carbon/human/mob_has_gravity()
	. = ..()
	if(!.)
		if(mob_negates_gravity())
			. = 1

/mob/living/carbon/human/mob_negates_gravity()
	return shoes && shoes.negates_gravity()
