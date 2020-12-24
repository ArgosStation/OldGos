/obj/effect/overmap/visitable/ship/argos
	name = "Argos"
	desc = "A heavily frankensteined Sol-Ceti fleet ship."
	fore_dir = NORTH
	vessel_mass = 100000
	burn_delay = 2 SECONDS
	base = TRUE

	initial_restricted_waypoints = list() //occupied landing sites, IE roundstart shuttles

	initial_generic_waypoints = list() //the various landing sites around the ship

/* skeleton for when we make new shuttles
/obj/effect/overmap/visitable/ship/landable/guppy
	name = "Guppy"
	desc = "An SSE-U3 utility pod, broadcasting SCGEC codes and the callsign \"Torch-3 Guppy\"."
	shuttle = "Guppy"
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 3000 //very inefficient pod
	fore_dir = SOUTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_TINY
*/
