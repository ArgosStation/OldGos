//the single area
/area/ship/adherentpod
	name = "\improper Adherent Pod"
	icon_state = "green"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	base_turf = /turf/space

//turf
/turf/simulated/wall/crystal/adherent
	color = COLOR_CYAN

/turf/simulated/floor/shuttle_ceiling/adherent
	color = COLOR_CYAN

//overmap
/datum/map_template/ruin/exoplanet/adherentpod
	name = "Adherent Pod"
	id = "awaysite_adherentpod"
	description = "smaller medium-sized functional adherent pod"
	suffixes = list("adherentpod/adherentpod.dmm")
	cost = 99 //for admin use only, may make a spawn job for this
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_ALIEN
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/adherentpod)

/obj/effect/overmap/visitable/ship/landable/adherentpod
	name = "Unmanned Autonomous Vessel"
	shuttle = "Adherent Pod"
	color = "#00ff44"
	vessel_mass = 750
	vessel_size = SHIP_SIZE_TINY
	fore_dir = NORTH

/datum/shuttle/autodock/overmap/adherentpod
	name = "Adherent Pod"
	warmup_time = 5
	current_location = "nav_adherentpod_start"
	range = 2
	shuttle_area = list(/area/ship/adherentpod)
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/adherent

/obj/effect/shuttle_landmark/adherentpod/start
	name = "Landing Zone"
	landmark_tag = "nav_adherentpod_start"

/obj/machinery/computer/shuttle_control/explore/adherentpod
	name = "Adherent Pod control console"
	shuttle_tag = "Adherent Pod"

//fancy machinery

/obj/machinery/fabricator/adherent
	name = "\improper Crystalline nanofabricator"
	desc = "A squat, complicated fabrication system clad in crystalline polymer."
	icon = 'icons/obj/machines/fabricators/nanofabricator.dmi'
	icon_state = "nanofab"
	base_icon_state = "nanofab"
	color = COLOR_CYAN
	req_access = newlist()
	base_type = /obj/machinery/fabricator
	construct_state = /decl/machine_construction/default/no_deconstruct
	fab_status_flags = FAB_HACKED

/obj/machinery/power/ascent_reactor/adherent
	name = "electron nexus"
	desc = "A tall, crystalline pylon that pulses with electricity."
	icon = 'icons/obj/machines/adherent.dmi'
	icon_state = "pedestal"
	output_power = 3000 KILOWATTS
	color = null
	anchored = TRUE
	density = TRUE
	opacity = FALSE
	var/next_use

/obj/machinery/power/ascent_reactor/adherent/attack_ai(var/mob/living/user)
	if(Adjacent(user))
		attack_hand(user)

/obj/machinery/power/ascent_reactor/adherent/attack_hand(var/mob/living/user)
	charge_user(user)

/obj/machinery/power/ascent_reactor/adherent/proc/charge_user(var/mob/living/user)
	if(next_use > world.time) return
	next_use = world.time + 10
	var/mob/living/carbon/human/H = user
	var/obj/item/weapon/cell/power_cell
	if(ishuman(user))
		var/obj/item/organ/internal/cell/cell = locate() in H.internal_organs
		if(cell && cell.cell)
			power_cell = cell.cell
	else if(isrobot(user))
		var/mob/living/silicon/robot/robot = user
		power_cell = robot.get_cell()

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.visible_message(SPAN_WARNING("There is a loud crack and the smell of ozone as \the [user] touches \the [src]."))
	playsound(loc, 'sound/effects/snap.ogg', 50, 1)
	if(power_cell)
		power_cell.charge = power_cell.maxcharge
		to_chat(user, "<span class='notice'><b>Your [power_cell] has been charged to capacity.</b></span>")
	if(istype(H) && H.species.name == SPECIES_ADHERENT)
		return
	if(isrobot(user))
		user.apply_damage(150, BURN, def_zone = BP_CHEST)
		visible_message("<span class='danger'>Electricity arcs off [user] as it touches \the [src]!</span>")
		to_chat(user, "<span class='danger'><b>You detect damage to your components!</b></span>")
	else
		user.electrocute_act(100, src, def_zone = BP_CHEST)
		visible_message("<span class='danger'>\The [user] has been shocked by \the [src]!</span>")
	user.throw_at(get_step(user,get_dir(src,user)), 5, 10)

/obj/machinery/power/ascent_reactor/adherent/attackby(obj/item/grab/normal/G, mob/user)
	if(!istype(G))
		return
	var/mob/M = G.affecting
	charge_user(M)

/obj/machinery/power/ascent_reactor/adherent/Bumped(atom/AM)
	if(ishuman(AM))
		charge_user(AM)

/obj/machinery/power/ascent_reactor/adherent/hitby(atom/AM)
	. =..()
	if(ishuman(AM))
		charge_user(AM)

/obj/machinery/power/ascent_reactor/adherent/on_update_icon()
	. = ..()

	if(!field_image)
		field_image = image(icon = 'icons/obj/machines/power/fusion.dmi', icon_state = "emfield_s1")
		field_image.color = COLOR_CYAN
		field_image.alpha = 50
		field_image.layer = SINGULARITY_LAYER
		field_image.appearance_flags |= RESET_COLOR

		var/matrix/M = matrix()
		M.Scale(3)
		field_image.transform = M

	if(on)
		overlays |= field_image
		set_light(0.8, 1, 6, l_color = COLOR_CYAN)
		icon_state = "pedestal"
	else
		overlays -= field_image
		set_light(0)
		icon_state = "pedestal"

//cycling airlock alternative, finally
	/obj/effect/adherentairlock
	name = "gas suspension field"
	desc = "A strange cyan mist. It seems to block the flow of gases."
	icon = 'icons/effects/effects.dmi'//TODO: better icon
	icon_state = "smoke"
	color = "#00ffff"
	anchored = 1
	density = 0
	unacidable = 1
	atmos_canpass = CANPASS_NEVER

//lighting
/obj/machinery/light/adherent
	name = "crystalline light"
	light_type = /obj/item/weapon/light/tube/skrell
	desc = "Some kind of strange alien lighting technology"

/obj/item/weapon/light/tube/adherent
	name = "crystalline light filament"
	color = COLOR_LIGHT_CYAN
	b_colour = COLOR_LIGHT_CYAN
	desc = "Some kind of strange alien lightbulb technology."
