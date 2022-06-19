SUBSYSTEM_DEF(statistics)
	name = "Statistics"
	wait = 6000 // 10 minute delay between fires
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME // Only count time actually ingame to avoid logging pre-round dips
	offline_implications = "Player count and admin count statistics will no longer be logged to the database. No immediate action is needed."


/datum/controller/subsystem/statistics/Initialize(start_timeofday)
	if(!SSdbcore.IsConnected())
		flags |= SS_NO_FIRE // Disable firing if SQL is disabled
	return ..()

/datum/controller/subsystem/statistics/fire(resumed = 0)
	sql_poll_players()

/datum/controller/subsystem/statistics/proc/sql_poll_players()
	if(!SSdbcore.IsConnected())
		return
	else
		/datum/db_query/prepared/insert_legacy_population
			sqlite_query = "INSERT INTO legacy_population (playercount, admincount, time, server_id) VALUES (:playercount, :admincount, datetime('now'), :server_id)"
			mysql_query = "INSERT INTO legacy_population (playercount, admincount, time, server_id) VALUES (:playercount, :admincount, NOW(), :server_id)"

		var/datum/db_query/statquery = SSdbcore.NewQuery(
			/datum/db_query/prepared/insert_legacy_population,
			list(
				"playercount" = length(GLOB.clients),
				"admincount" = length(GLOB.admins),
				"server_id" = GLOB.configuration.system.instance_id
			)
		)
		statquery.warn_execute()
		qdel(statquery)
