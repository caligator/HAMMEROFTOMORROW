/obj/item/weapon/phone
	name = "red phone"
	desc = "Should anything ever go wrong..."
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	force = 3.0
	throwforce = 2.0
	throw_speed = 3
	throw_range = 4
	w_class = 2
	attack_verb = list("called", "rang")
	hitsound = 'sound/weapons/ring.ogg'

/obj/item/weapon/rsp
	name = "\improper Rapid-Seed-Producer (RSP)"
	desc = "A device used to rapidly deploy seeds."
	icon = 'icons/obj/items.dmi'
	icon_state = "rcd"
	opacity = 0
	density = 0
	anchored = 0.0
	var/matter = 0
	var/mode = 1
	w_class = 3.0

/obj/item/weapon/spacecash
	name = "space cash"
	desc = "It's worth 1 credit."
	gender = PLURAL
	icon = 'icons/obj/economy.dmi'
	icon_state = "spacecash"
	opacity = 0
	density = 0
	anchored = 0.0
	force = 0
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = 1.0

/obj/item/weapon/spacecash/c10
	icon_state = "spacecash10"
	desc = "It's worth 10 credits."

/obj/item/weapon/spacecash/c20
	icon_state = "spacecash20"
	desc = "It's worth 20 credits."

/obj/item/weapon/spacecash/c50
	icon_state = "spacecash50"
	desc = "It's worth 50 credits."

/obj/item/weapon/spacecash/c100
	icon_state = "spacecash100"
	desc = "It's worth 100 credits."

/obj/item/weapon/spacecash/c200
	icon_state = "spacecash200"
	desc = "It's worth 200 credits."

/obj/item/weapon/spacecash/c500
	icon_state = "spacecash500"
	desc = "It's worth 500 credits."

/obj/item/weapon/spacecash/c1000
	icon_state = "spacecash1000"
	desc = "It's worth 1000 credits."

/obj/item/weapon/soap
	name = "soap"
	desc = "A cheap bar of soap. Doesn't smell."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "soap"
	w_class = 1.0
	throwforce = 0
	throw_speed = 3
	throw_range = 7

/obj/item/weapon/soap/nanotrasen
	desc = "A Nanotrasen brand bar of soap. Smells of plasma."
	icon_state = "soapnt"

/obj/item/weapon/soap/deluxe
	desc = "A deluxe Waffle Co. brand bar of soap. Smells of condoms."
	icon_state = "soapdeluxe"

/obj/item/weapon/soap/syndie
	desc = "An untrustworthy bar of soap. Smells of fear."
	icon_state = "soapsyndie"

/obj/item/weapon/bikehorn
	name = "bike horn"
	desc = "A horn off of a bicycle."
	icon = 'icons/obj/items.dmi'
	icon_state = "bike_horn"
	item_state = "bike_horn"
	throwforce = 0
	force = 0
	throwhitsound = 'sound/items/bikehorn.ogg'
	hitsound = 'sound/items/bikehorn.ogg'
	w_class = 1.0
	throw_speed = 3
	throw_range = 7
	attack_verb = list("HONKED")
	var/spam_flag = 0

/obj/item/weapon/c_tube
	name = "cardboard tube"
	desc = "A tube... of cardboard."
	icon = 'icons/obj/items.dmi'
	icon_state = "c_tube"
	throwforce = 0
	w_class = 1.0
	throw_speed = 3
	throw_range = 5


/obj/item/weapon/cane
	name = "cane"
	desc = "A cane used by a true gentlemen. Or a clown."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cane"
	item_state = "stick"
	force = 5.0
	throwforce = 5
	w_class = 2.0
	m_amt = 50
	attack_verb = list("bludgeoned", "whacked", "disciplined", "thrashed")

/obj/item/weapon/disk
	name = "disk"
	icon = 'icons/obj/items.dmi'

/obj/item/weapon/disk/nuclear
	name = "nuclear authentication disk"
	desc = "Better keep this safe."
	icon_state = "nucleardisk"
	item_state = "card-id"
	w_class = 1.0

/*
/obj/item/weapon/game_kit
	name = "Gaming Kit"
	icon = 'icons/obj/items.dmi'
	icon_state = "game_kit"
	var/selected = null
	var/board_stat = null
	var/data = ""
	var/base_url = "http://svn.slurm.us/public/spacestation13/misc/game_kit"
	item_state = "sheet-metal"
	w_class = 5.0
*/

/obj/item/weapon/legcuffs
	name = "legcuffs"
	desc = "Use this to keep prisoners in line."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "handcuff"
	flags = CONDUCT
	throwforce = 0
	w_class = 3.0
	origin_tech = "materials=1"
	slowdown = 7
	var/breakouttime = 300	//Deciseconds = 30s = 0.5 minute

/obj/item/weapon/legcuffs/beartrap
	name = "bear trap"
	throw_speed = 1
	throw_range = 1
	icon_state = "beartrap0"
	desc = "A trap used to catch bears and other legged creatures."
	var/armed = 0

/obj/item/weapon/legcuffs/beartrap/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is putting the [src.name] on \his head! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS)

/obj/item/weapon/legcuffs/beartrap/attack_self(mob/user as mob)
	..()
	if(ishuman(user) && !user.stat && !user.restrained())
		armed = !armed
		icon_state = "beartrap[armed]"
		user << "<span class='notice'>[src] is now [armed ? "armed" : "disarmed"]</span>"


/obj/item/weapon/legcuffs/beartrap/Crossed(AM as mob|obj)
	if(armed && isturf(src.loc))
		if( (iscarbon(AM) || isanimal(AM)) && !istype(AM, /mob/living/simple_animal/parrot) && !istype(AM, /mob/living/simple_animal/construct) && !istype(AM, /mob/living/simple_animal/shade) && !istype(AM, /mob/living/simple_animal/hostile/viscerator))
			var/mob/living/L = AM
			armed = 0
			icon_state = "beartrap0"
			playsound(src.loc, 'sound/effects/snap.ogg', 50, 1)
			L.visible_message("<span class='danger'>[L] triggers \the [src].</span>", \
					"<span class='userdanger'>You trigger \the [src]!</span>")

			if(ishuman(AM))
				var/mob/living/carbon/H = AM
				if(H.lying)
					H.apply_damage(20,BRUTE,"chest")
				else
					H.apply_damage(20,BRUTE,(pick("l_leg", "r_leg")))
				if(!H.legcuffed) //beartrap can't cuff you leg if there's already a beartrap or legcuffs.
					H.legcuffed = src
					src.loc = H
					H.update_inv_legcuffed(0)
					feedback_add_details("handcuffs","B") //Yes, I know they're legcuffs. Don't change this, no need for an extra variable. The "B" is used to tell them apart.

			else
				L.apply_damage(20,BRUTE)
	..()



/obj/item/weapon/rack_parts
	name = "rack parts"
	desc = "Parts of a rack."
	icon = 'icons/obj/items.dmi'
	icon_state = "rack_parts"
	flags = CONDUCT
	m_amt = 3750

/obj/item/weapon/staff
	name = "wizards staff"
	desc = "Apparently a staff used by the wizard."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "staff"
	force = 3.0
	throwforce = 5.0
	throw_speed = 2
	throw_range = 5
	w_class = 2.0
	flags = NOSHIELD
	attack_verb = list("bludgeoned", "whacked", "disciplined")

/obj/item/weapon/staff/broom
	name = "broom"
	desc = "Used for sweeping, and flying into the night while cackling. Black cat not included."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"

/obj/item/weapon/staff/stick
	name = "stick"
	desc = "A great tool to drag someone else's drinks across the bar."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "stick"
	item_state = "stick"
	force = 3.0
	throwforce = 5.0
	throw_speed = 2
	throw_range = 5
	w_class = 2.0
	flags = NOSHIELD

/obj/item/weapon/table_parts
	name = "table parts"
	desc = "Parts of a table. Poor table."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "table_parts"
	m_amt = 3750
	flags = CONDUCT
	attack_verb = list("slammed", "bashed", "battered", "bludgeoned", "thrashed", "whacked")

/obj/item/weapon/table_parts/reinforced
	name = "reinforced table parts"
	desc = "Hard table parts. Well...harder..."
	icon = 'icons/obj/items.dmi'
	icon_state = "reinf_tableparts"
	m_amt = 7500
	flags = CONDUCT

/obj/item/weapon/table_parts/wood
	name = "wooden table parts"
	desc = "Keep away from fire."
	icon_state = "wood_tableparts"
	flags = null

/obj/item/weapon/table_parts/wood/poker
	name = "poker table parts"
	desc = "Keep away from fire, and keep near seedy dealers."
	icon_state = "poker_tableparts"
	flags = null

/obj/item/weapon/module
	icon = 'icons/obj/module.dmi'
	icon_state = "std_module"
	w_class = 2.0
	item_state = "electronic"
	flags = CONDUCT

/obj/item/weapon/module/card_reader
	name = "card reader module"
	icon_state = "card_mod"
	desc = "An electronic module for reading data and ID cards."

/obj/item/weapon/module/power_control
	name = "power control module"
	icon_state = "power_mod"
	desc = "Heavy-duty switching circuits for power control."

/obj/item/weapon/module/id_auth
	name = "\improper ID authentication module"
	icon_state = "id_mod"
	desc = "A module allowing secure authorization of ID cards."

/obj/item/weapon/module/cell_power
	name = "power cell regulator module"
	icon_state = "power_mod"
	desc = "A converter and regulator allowing the use of power cells."

/obj/item/weapon/module/cell_power
	name = "power cell charger module"
	icon_state = "power_mod"
	desc = "Charging circuits for power cells."

/obj/item/weapon/syntiflesh
	name = "syntiflesh"
	desc = "Meat that appears...strange..."
	icon = 'icons/obj/food.dmi'
	icon_state = "meat"
	flags = CONDUCT
	w_class = 1.0
	origin_tech = "biotech=2"

/obj/item/weapon/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	flags = CONDUCT
	force = 12.0
	w_class = 1.0
	throwforce = 15.0
	throw_speed = 3
	throw_range = 4
	m_amt = 15000
	origin_tech = "materials=2;combat=1"
	attack_verb = list("chopped", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/weapon/scythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force = 13.0
	throwforce = 5.0
	throw_speed = 2
	throw_range = 3
	w_class = 4.0
	flags = CONDUCT | NOSHIELD
	slot_flags = SLOT_BACK
	origin_tech = "materials=2;combat=2"
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	hitsound = 'sound/weapons/bladeslice.ogg'

/*
/obj/item/weapon/cigarpacket
	name = "Pete's Cuban Cigars"
	desc = "The most robust cigars on the planet."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "cigarpacket"
	item_state = "cigarpacket"
	w_class = 1
	throwforce = 2
	var/cigarcount = 6
*/

/obj/item/weapon/pai_cable
	desc = "A flexible coated cable with a universal jack on one end."
	name = "data cable"
	icon = 'icons/obj/power.dmi'
	icon_state = "wire1"

	var/obj/machinery/machine

///////////////////////////////////////Stock Parts /////////////////////////////////

/obj/item/weapon/storage/part_replacer
	name = "Rapid Part Exchange Device"
	desc = "Special mechanical module made to store, sort, and apply standard machine parts."
	icon_state = "RPED"
	item_state = "RPED"
	w_class = 5
	can_hold = list(/obj/item/weapon/stock_parts)
	storage_slots = 14
	use_to_pickup = 1
	allow_quick_gather = 1
	allow_quick_empty = 1
	collection_mode = 1
	max_w_class = 3
	max_combined_w_class = 28

/obj/item/weapon/stock_parts
	name = "stock part"
	desc = "What?"
	icon = 'icons/obj/stock_parts.dmi'
	w_class = 2.0
	var/rating = 1
	New()
		src.pixel_x = rand(-5.0, 5)
		src.pixel_y = rand(-5.0, 5)

//Rank 1

/obj/item/weapon/stock_parts/console_screen
	name = "console screen"
	desc = "Used in the construction of computers and other devices with a interactive console."
	icon_state = "screen"
	origin_tech = "materials=1"
	g_amt = 200

/obj/item/weapon/stock_parts/capacitor
	name = "capacitor"
	desc = "A basic capacitor used in the construction of a variety of devices."
	icon_state = "capacitor"
	origin_tech = "powerstorage=1"
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module
	name = "scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "scan_module"
	origin_tech = "magnets=1"
	m_amt = 50
	g_amt = 20

/obj/item/weapon/stock_parts/manipulator
	name = "micro-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "micro_mani"
	origin_tech = "materials=1;programming=1"
	m_amt = 30

/obj/item/weapon/stock_parts/micro_laser
	name = "micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "micro_laser"
	origin_tech = "magnets=1"
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin
	name = "matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "matter_bin"
	origin_tech = "materials=1"
	m_amt = 80

//Rank 2

/obj/item/weapon/stock_parts/capacitor/adv
	name = "advanced capacitor"
	desc = "An advanced capacitor used in the construction of a variety of devices."
	icon_state = "adv_capacitor"
	origin_tech = "powerstorage=3"
	rating = 2
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module/adv
	name = "advanced scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "adv_scan_module"
	origin_tech = "magnets=3"
	rating = 2
	m_amt = 50
	g_amt = 20

/obj/item/weapon/stock_parts/manipulator/nano
	name = "nano-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "nano_mani"
	origin_tech = "materials=3;programming=2"
	rating = 2
	m_amt = 30

/obj/item/weapon/stock_parts/micro_laser/high
	name = "high-power micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "high_micro_laser"
	origin_tech = "magnets=3"
	rating = 2
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin/adv
	name = "advanced matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "advanced_matter_bin"
	origin_tech = "materials=3"
	rating = 2
	m_amt = 80

//Rating 3

/obj/item/weapon/stock_parts/capacitor/super
	name = "super capacitor"
	desc = "A super-high capacity capacitor used in the construction of a variety of devices."
	icon_state = "super_capacitor"
	origin_tech = "powerstorage=5;materials=4"
	rating = 3
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module/phasic
	name = "phasic scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	icon_state = "super_scan_module"
	origin_tech = "magnets=5"
	rating = 3
	m_amt = 50
	g_amt = 20

/obj/item/weapon/stock_parts/manipulator/pico
	name = "pico-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "pico_mani"
	origin_tech = "materials=5;programming=2"
	rating = 3
	m_amt = 30

/obj/item/weapon/stock_parts/micro_laser/ultra
	name = "ultra-high-power micro-laser"
	icon_state = "ultra_high_micro_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = "magnets=5"
	rating = 3
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin/super
	name = "super matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "super_matter_bin"
	origin_tech = "materials=5"
	rating = 3
	m_amt = 80

// Subspace stock parts

/obj/item/weapon/stock_parts/subspace/ansible
	name = "subspace ansible"
	icon_state = "subspace_ansible"
	desc = "A compact module capable of sensing extradimensional activity."
	origin_tech = "programming=2;magnets=3;materials=2;bluespace=1"
	m_amt = 30
	g_amt = 10

/obj/item/weapon/stock_parts/subspace/filter
	name = "hyperwave filter"
	icon_state = "hyperwave_filter"
	desc = "A tiny device capable of filtering and converting super-intense radiowaves."
	origin_tech = "programming=2;magnets=1"
	m_amt = 30
	g_amt = 10

/obj/item/weapon/stock_parts/subspace/amplifier
	name = "subspace amplifier"
	icon_state = "subspace_amplifier"
	desc = "A compact micro-machine capable of amplifying weak subspace transmissions."
	origin_tech = "programming=2;magnets=2;materials=2;bluespace=1"
	m_amt = 30
	g_amt = 10

/obj/item/weapon/stock_parts/subspace/treatment
	name = "subspace treatment disk"
	icon_state = "treatment_disk"
	desc = "A compact micro-machine capable of stretching out hyper-compressed radio waves."
	origin_tech = "programming=2;magnets=1;materials=3;bluespace=1"
	m_amt = 30
	g_amt = 10

/obj/item/weapon/stock_parts/subspace/analyzer
	name = "subspace wavelength analyzer"
	icon_state = "wavelength_analyzer"
	desc = "A sophisticated analyzer capable of analyzing cryptic subspace wavelengths."
	origin_tech = "programming=2;magnets=2;materials=2;bluespace=1"
	m_amt = 30
	g_amt = 10

/obj/item/weapon/stock_parts/subspace/crystal
	name = "ansible crystal"
	icon_state = "ansible_crystal"
	desc = "A crystal made from pure glass used to transmit laser databursts to subspace."
	origin_tech = "magnets=2;materials=2;bluespace=1"
	g_amt = 50

/obj/item/weapon/stock_parts/subspace/transmitter
	name = "subspace transmitter"
	icon_state = "subspace_transmitter"
	desc = "A large piece of equipment used to open a window into the subspace dimension."
	origin_tech = "magnets=3;materials=3;bluespace=2"
	m_amt = 50

/obj/item/weapon/ectoplasm
	name = "ectoplasm"
	desc = "spooky"
	gender = PLURAL
	icon = 'icons/obj/wizard.dmi'
	icon_state = "ectoplasm"

/obj/item/weapon/research//Makes testing much less of a pain -Sieve
	name = "research"
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "capacitor"
	desc = "A debug item for research."
	origin_tech = "materials=8;programming=8;magnets=8;powerstorage=8;bluespace=8;combat=8;biotech=8;syndicate=8"
