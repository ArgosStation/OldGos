//areas
/area/ship/skrellscoutship/pod/toilets
	name = "\improper Bathroom"
	icon_state = "toilet"

/area/ship/skrellscoutship/pod/power
	name = "\improper Engineering"
	icon_state = "engine_smes"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/skrellscoutship/pod/bridge
	name = "\improper Pod Helm"
	icon_state = "bridge"

/area/ship/skrellscoutship/pod/hallway
	name = "\improper Central Corridor"
	icon_state = "green"

/area/ship/skrellscoutship/pod/foyer
	name = "\improper Foyer"
	icon_state = "entry_1"

/area/ship/skrellscoutship/pod/armory
	name = "\improper Armory"
	icon_state = "shuttlered"

/area/ship/skrellscoutship/pod/quarters
	name = "\improper Quarters"
	icon_state = "crew_quarters"

/area/ship/skrellscoutship/pod/medbay
	name = "\improper Medical Bay"
	icon_state = "medbay"

//shuttle stuff
/datum/map_template/ruin/exoplanet/skrellpod
	name = "Skrell Pod"
	id = "awaysite_skrellpod"
	description = "medium-sized functional skrell ship"
	suffixes = list("skrellpod/skrellpod.dmm")
	cost = 99 //for admin use only
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_ALIEN
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/skrellpod)

/obj/effect/overmap/visitable/ship/landable/skrellpod
	name = "SV-P"
	shuttle = "Skrellian Pod"
	color = "#880088"
	vessel_mass = 1500
	vessel_size = SHIP_SIZE_SMALL
	fore_dir = NORTH

/datum/shuttle/autodock/overmap/skrellpod
	name = "Skrellian Pod"
	warmup_time = 5
	current_location = "nav_skrellpod_start"
	range = 2
	shuttle_area = list(
		/area/ship/skrellscoutship/pod/toilets, /area/ship/skrellscoutship/pod/power, /area/ship/skrellscoutship/pod/bridge,
		/area/ship/skrellscoutship/pod/hallway, /area/ship/skrellscoutship/pod/foyer, /area/ship/skrellscoutship/pod/armory,
		/area/ship/skrellscoutship/pod/quarters, /area/ship/skrellscoutship/pod/medbay
		)
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/skrell

/obj/effect/shuttle_landmark/skrellpod/start
	name = "Landing Zone"
	landmark_tag = "nav_skrellpod_start"

/obj/machinery/computer/shuttle_control/explore/skrellpod
	name = "Skrellian Pod control console"
	req_access = list(access_skrellscoutship)
	shuttle_tag = "Skrellian Pod"
