/client/proc/view_instances()
	set name = "View Server Instances"
	set desc = "View the running server instances"
	set category = "Server"

	if(!check_rights(R_ADMIN))
		return

	to_chat(usr, "<b>Server instances info</b>")

	/datum/db_query/prepared/get_server_instances
		sqlite_query = {"
		SELECT server_id, key_name, key_value FROM instance_data_cache WHERE server_id IN
		(SELECT server_id FROM instance_data_cache WHERE
		key_name='heartbeat' AND last_updated BETWEEN datetime('now') AND datetime('now', '-1 minute'))
		AND key_name IN ("playercount")"}
		mysql_query = {"
		SELECT server_id, key_name, key_value FROM instance_data_cache WHERE server_id IN
		(SELECT server_id FROM instance_data_cache WHERE
		key_name='heartbeat' AND last_updated BETWEEN NOW() - INTERVAL 60 SECOND AND NOW())
		AND key_name IN ("playercount")"}

	var/datum/db_query/dbq1 = SSdbcore.NewQuery(/datum/db_query/prepared/get_server_instances)
	if(!dbq1.warn_execute())
		qdel(dbq1)
		return

	var/servers_outer = list()
	while(dbq1.NextRow())
		if(!servers_outer[dbq1.item[1]])
			servers_outer[dbq1.item[1]] = list()

		servers_outer[dbq1.item[1]][dbq1.item[2]] = dbq1.item[3] // This should assoc load our data

	qdel(dbq1)

	for(var/server in servers_outer)
		var/server_data = servers_outer[server]
		var/players = text2num(server_data["playercount"])

		to_chat(usr, "<code>[server]</code> - [players] player[players == 1 ? "" : "s"] online.")
	to_chat(usr, "<i>Offline instances are not reported</i>")
