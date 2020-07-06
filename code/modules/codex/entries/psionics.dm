/datum/codex_entry/cuchulain_foundation
	display_name = "Psionic Control Administration"
	associated_strings = list("Psionic", "Control", "Administration")
	associated_paths = list(
		/obj/item/weapon/storage/briefcase/foundation,
		/obj/item/weapon/gun/projectile/revolver/foundation,
		/obj/item/weapon/card/id/foundation,
		/obj/item/weapon/card/id/foundation_civilian,
		/obj/item/clothing/suit/storage/toggle/labcoat/foundation,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/foundation
	)
	lore_text = "The Psionic Control Administration is a Sol-Ceti Axis government research organisation based out of Neptune orbit. Their logo is \
	an upward-facing radio telescope dish, usually printed in green. They perform general research into psionics on behalf\
	of the SCA military, as well as the expeditionary corps. They are also the single largest psionic registration \
	and oversight body in human space, responsible for educating and training operants within the SCA at no cost.\
	<br><br> \
	The rest of the article is an indecipherable haze that slips out of your memory as soon as you \
	finish reading it, but you feel pretty satisfied and informed by the end."
	antag_text = "The Psionic Control Administration is an anti-occult ERT-like body. They are equipped with \
	nullglass weapons that can disrupt or destroy psi-powers, and have their own moderately powerful \
	psionic abilities. They make heavy use of psionic influence to cloud and disrupt efforts at \
	researching or understanding them, and the depth and nature of their influence within the Axis is unclear."

/datum/codex_entry/psionics
	display_name = "Psionics"
	associated_strings = list("Psychic", "Psychic Powers", "Psi")
	associated_paths = list(
		/obj/item/weapon/book/manual/psionics,
		/obj/item/clothing/head/helmet/space/psi_amp,
		/obj/item/clothing/head/helmet/space/psi_amp/lesser
	)
	lore_text = "Psionics are a relatively new phenomenon theorized to be linked to long-term exposure \
	to deep, uninhabited space. A tiny, tiny subset of people exposed to such conditions can develop the \
	ability to perform small feats like levitating coins or removing a headache with nothing but their mind. \
	Since the Collapse, the rate and strength of psionics has greatly increased throughout the galaxy as a whole.\
	Three decades of study has resulted in the Axis determining that these psionics don't pose \
	an operational or health risk, but they do encourage operants to register with the Psionic Control Administration. \
	Operants are often used for bluespace navigation, due to their unique abilities making the navigation of a strange and hostile dimension easier.\
	<br><br> \
	However, psionics-enhancing implants, drugs and procedures are illegal in most human space, and \
	statistically seem to end in death for those foolish enough to make use of them. Being caught with a \
	cerebroenergetic enhancer, or the drug Three Eye, will net you a hefty prison sentence."
	mechanics_text = "Psionic operants have a brain icon on the bottom right of the HUD. They can click it to toggle \
	their powers, or examine it to see the details of how to invoke each power, as well as their mental state. Items \
	made of nullglass will stop the use of powers, and overuse of powers can cause lethal brain damage."
	antag_text = "Psionic amplifiers are illegal equipment, but can boost your psionics to massive levels at the cost \
	of occupying your hat slot permanently."