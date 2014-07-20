/obj/item/projectile/energy
	name = "energy"
	icon_state = "spark"
	damage = 0
	damage_type = BURN
	flag = "energy"
	trace_residue = "Minor electrical discolouration."


/obj/item/projectile/energy/electrode
	name = "electrode"
	icon_state = "spark"
	nodamage = 1
	stun = 10
	weaken = 10
	stutter = 10
	hitsound = "sparks"

	on_hit(var/atom/target, var/blocked = 0)
		if(!ismob(target) || blocked >= 2) //Fully blocked by mob or collided with dense object - burst into sparks!
			var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread
			sparks.set_up(1, 1, src)
			sparks.start()
		..()

/obj/item/projectile/energy/declone
	name = "declown"
	icon_state = "declone"
	nodamage = 1
	damage_type = CLONE
	irradiate = 40
	trace_residue = "Active protein agents."


/obj/item/projectile/energy/dart
	name = "dart"
	icon_state = "toxin"
	damage = 5
	damage_type = TOX
	weaken = 5
	trace_residue = null


/obj/item/projectile/energy/bolt
	name = "bolt"
	icon_state = "cbbolt"
	damage = 10
	damage_type = TOX
	nodamage = 0
	weaken = 10
	stutter = 10
	trace_residue = null


/obj/item/projectile/energy/bolt/large
	name = "largebolt"
	damage = 10

/obj/item/projectile/energy/disabler
	name = "disabler beam"
	icon_state = "omnilaser"
	damage = 34
	damage_type = STAMINA
	var/range = 7

/obj/item/projectile/energy/disabler/Range()
	range--
	if(range <= 0)
		delete()



