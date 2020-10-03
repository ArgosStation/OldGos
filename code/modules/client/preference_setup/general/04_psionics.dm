var/global/list/PSIONIC_FACULTIES = list("Coercion", "Energistics", "Psychokinesis", "Redaction")
var/global/list/PSIONIC_FACULTIES_NUMERIC = list("[PSI_COERCION]", "[PSI_ENERGISTICS]", "[PSI_PSYCHOKINESIS]", "[PSI_REDACTION]")

var/global/list/PSIONIC_RANKS = list("Latent", "Operant", "Master")
var/global/list/PSIONIC_RANKS_NUMERIC = list(PSI_RANK_LATENT, PSI_RANK_OPERANT, PSI_RANK_MASTER)

/datum/preferences
	var/psionic
	var/faculty
	var/psi_rank
	var/implant

/datum/category_item/player_setup_item/physical/psionics
	name = "Psionics"
	sort_order = 4

/datum/category_item/player_setup_item/physical/psionics/load_character(var/savefile/S)
	from_file(S["psionic"], pref.psionic)
	from_file(S["faculty"], pref.faculty)
	from_file(S["psi_rank"], pref.psi_rank)
	from_file(S["implant"], pref.implant)

/datum/category_item/player_setup_item/physical/psionics/save_character(var/savefile/S)
	to_file(S["psionic"], pref.psionic)
	to_file(S["faculty"], pref.faculty)
	to_file(S["psi_rank"], pref.psi_rank)
	to_file(S["implant"], pref.implant)

/datum/category_item/player_setup_item/physical/psionics/sanitize_character(var/savefile/S)
	pref.psionic = sanitize_bool(pref.psionic, FALSE)
	pref.faculty = sanitize_inlist(pref.faculty, PSIONIC_FACULTIES_NUMERIC, get_key_by_index(PSIONIC_FACULTIES_NUMERIC, 0))
	pref.psi_rank = sanitize_inlist(pref.psi_rank, PSIONIC_RANKS_NUMERIC, get_key_by_index(PSIONIC_RANKS_NUMERIC, 0))
	pref.implant = sanitize_bool(pref.implant, TRUE)

/datum/category_item/player_setup_item/physical/psionics/content()
	. = list()
	. += "<b>Psionics:</b><br>"
	. += "Psionic: "
	. += "<a href='?src=\ref[src];psionic=1'>[pref.psionic ? "Yes" : "No"]</a>"
	if(pref.psionic)
		. += "<br>"
		. += "Faculty: "
		. += "<a href='?src=\ref[src];faculty=1'>[pref.faculty]</a><br>"

		. += "Rank: "
		var/psiRank = PSIONIC_RANKS[pref.psi_rank]
		. += "<a href='?src=\ref[src];psi_rank=1'>[psiRank]</a><br>"

		. += "Implant: "
		. += "<a href='?src=\ref[src];implant=1'>[pref.implant ? "Yes" : "No"]</a>"
		if(!pref.implant)
			. += "<br>"
			. += "<i>Warning: Psions without a dampener implant are considered illegal!</i><br>"
	return jointext(., null)

/datum/category_item/player_setup_item/physical/psionics/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(href_list["psionic"])
		pref.psionic = !pref.psionic
		return TOPIC_REFRESH

	else if(href_list["faculty"])
		var/switchFaculty = input("Select a psionic faculty:", "Psionic Faculty", pref.faculty) as anything in PSIONIC_FACULTIES_NUMERIC
		if(!switchFaculty)
			return TOPIC_NOACTION
		pref.faculty = switchFaculty
		return TOPIC_REFRESH

	else if(href_list["psi_rank"])
		var/switchPsiRank = input("Select a psionic ranking:", "Psionic Ranking", pref.psi_rank) as anything in PSIONIC_RANKS_NUMERIC
		if(!switchPsiRank)
			return TOPIC_NOACTION
		pref.psi_rank = switchPsiRank
		return TOPIC_REFRESH

	else if(href_list["implant"])
		pref.implant = !pref.implant
		return TOPIC_REFRESH