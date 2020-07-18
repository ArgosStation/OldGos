/obj/item/weapon/stock_parts/circuitboard/voxfab
	name = T_BOARD("Vox biogenerator")
	build_path = /obj/machinery/voxfab
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2)
	req_components = list(
							/obj/item/weapon/stock_parts/matter_bin = 1,
							/obj/item/weapon/stock_parts/manipulator = 1
	)
	additional_spawn_components = list(
							/obj/item/weapon/stock_parts/console_screen = 1,
							/obj/item/weapon/stock_parts/keyboard = 1,
							/obj/item/weapon/stock_parts/power/apc/buildable = 1
	)