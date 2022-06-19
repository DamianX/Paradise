PRAGMA synchronous = OFF;
PRAGMA journal_mode = 'wal';
BEGIN TRANSACTION;
CREATE TABLE `characters` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ckey` TEXT NOT NULL,
	`slot` INTEGER NOT NULL,
	`OOC_Notes` TEXT NOT NULL,
	`real_name` TEXT NOT NULL,
	`name_is_always_random` INTEGER NOT NULL,
	`gender` TEXT NOT NULL,
	`age` INTEGER NOT NULL,
	`species` TEXT NOT NULL,
	`language` TEXT NOT NULL,
	`hair_colour` TEXT NOT NULL DEFAULT '#000000',
	`secondary_hair_colour` TEXT NOT NULL DEFAULT '#000000',
	`facial_hair_colour` TEXT NOT NULL DEFAULT '#000000',
	`secondary_facial_hair_colour` TEXT NOT NULL DEFAULT '#000000',
	`skin_tone` INTEGER NOT NULL,
	`skin_colour` TEXT NOT NULL DEFAULT '#000000',
	`marking_colours` TEXT NOT NULL DEFAULT 'head=%23000000&body=%23000000&tail=%23000000',
	`head_accessory_colour` TEXT NOT NULL DEFAULT '#000000',
	`hair_style_name` TEXT NOT NULL,
	`facial_style_name` TEXT NOT NULL,
	`marking_styles` TEXT NOT NULL DEFAULT 'head=None&body=None&tail=None',
	`head_accessory_style_name` TEXT NOT NULL,
	`alt_head_name` TEXT NOT NULL,
	`eye_colour` TEXT NOT NULL DEFAULT '#000000',
	`underwear` TEXT NOT NULL,
	`undershirt` TEXT NOT NULL,
	`backbag` TEXT DEFAULT NULL,
	`b_type` TEXT NOT NULL,
	`alternate_option` INTEGER NOT NULL,
	`job_support_high` INTEGER NOT NULL,
	`job_support_med` INTEGER NOT NULL,
	`job_support_low` INTEGER NOT NULL,
	`job_medsci_high` INTEGER NOT NULL,
	`job_medsci_med` INTEGER NOT NULL,
	`job_medsci_low` INTEGER NOT NULL,
	`job_engsec_high` INTEGER NOT NULL,
	`job_engsec_med` INTEGER NOT NULL,
	`job_engsec_low` INTEGER NOT NULL,
	`flavor_text` TEXT NOT NULL,
	`med_record` TEXT NOT NULL,
	`sec_record` TEXT NOT NULL,
	`gen_record` TEXT NOT NULL,
	`disabilities` INTEGER NOT NULL,
	`player_alt_titles` TEXT NOT NULL,
	`organ_data` TEXT NOT NULL,
	`rlimb_data` TEXT NOT NULL,
	`nanotrasen_relation` TEXT NOT NULL,
	`speciesprefs` INTEGER NOT NULL,
	`socks` TEXT NOT NULL,
	`body_accessory` TEXT NOT NULL,
	`gear` TEXT NOT NULL,
	`autohiss` INTEGER NOT NULL,
	`hair_gradient` TEXT NOT NULL,
	`hair_gradient_offset` TEXT NOT NULL DEFAULT '0,0',
	`hair_gradient_colour` TEXT NOT NULL DEFAULT '#000000',
	`hair_gradient_alpha` INTEGER NOT NULL DEFAULT '255'
) STRICT;
CREATE TABLE `customuseritems` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`cuiCKey` TEXT NOT NULL,
	`cuiRealName` TEXT NOT NULL,
	`cuiPath` TEXT NOT NULL,
	`cuiItemName` TEXT,
	`cuiDescription` TEXT,
	`cuiReason` TEXT,
	`cuiPropAdjust` TEXT,
	`cuiJobMask` TEXT NOT NULL
);
CREATE TABLE `death` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`pod` TEXT NOT NULL,
	`coord` TEXT NOT NULL,
	`tod` TEXT NOT NULL,
	`server_id` TEXT NULL DEFAULT NULL,
	`job` TEXT NOT NULL,
	`special` TEXT NOT NULL,
	`name` TEXT NOT NULL,
	`byondkey` TEXT NOT NULL,
	`laname` TEXT NOT NULL,
	`lakey` TEXT NOT NULL,
	`gender` TEXT NOT NULL,
	`bruteloss` INTEGER NOT NULL,
	`brainloss` INTEGER NOT NULL,
	`fireloss` INTEGER NOT NULL,
	`oxyloss` INTEGER NOT NULL
);
CREATE TABLE `donators` (
	`patreon_name` TEXT NOT NULL,
	`tier` INTEGER,
	`ckey` TEXT DEFAULT NULL,
	`start_date` TEXT,
	`end_date` TEXT,
	`active` INTEGER,
	PRIMARY KEY (`patreon_name`)
);
CREATE TABLE `admin` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ckey` TEXT NOT NULL,
	`admin_rank` TEXT NOT NULL DEFAULT 'Administrator',
	`level` INTEGER NOT NULL DEFAULT '0',
	`flags` INTEGER NOT NULL DEFAULT '0'
);
CREATE TABLE `admin_log` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`datetime` TEXT NOT NULL,
	`adminckey` TEXT NOT NULL,
	`adminip` TEXT NOT NULL,
	`log` TEXT NOT NULL
);
CREATE TABLE `ban` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`bantime` TEXT NOT NULL,
	`ban_round_id` INTEGER NULL DEFAULT NULL,
	`serverip` TEXT NOT NULL,
	`server_id` TEXT NULL DEFAULT NULL COLLATE BINARY,
	`bantype` TEXT NOT NULL,
	`reason` TEXT NOT NULL,
	`job` TEXT DEFAULT NULL,
	`duration` INTEGER NOT NULL,
	`rounds` INTEGER DEFAULT NULL,
	`expiration_time` TEXT NOT NULL,
	`ckey` TEXT NOT NULL,
	`computerid` TEXT NOT NULL,
	`ip` TEXT NOT NULL,
	`a_ckey` TEXT NOT NULL,
	`a_computerid` TEXT NOT NULL,
	`a_ip` TEXT NOT NULL,
	`who` TEXT NOT NULL,
	`adminwho` TEXT NOT NULL,
	`edits` TEXT DEFAULT NULL,
	`unbanned` INTEGER DEFAULT NULL,
	`unbanned_datetime` TEXT DEFAULT NULL,
	`unbanned_round_id` INTEGER NULL DEFAULT NULL,
	`unbanned_ckey` TEXT DEFAULT NULL,
	`unbanned_computerid` TEXT DEFAULT NULL,
	`unbanned_ip` TEXT DEFAULT NULL
);
CREATE TABLE `feedback` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`datetime` TEXT NOT NULL,
	`round_id` INTEGER NOT NULL,
	`key_name` TEXT NOT NULL,
	`key_type` TEXT NOT NULL,
	`version` INTEGER NOT NULL,
	`json` TEXT NOT NULL COLLATE BINARY
);
CREATE TABLE `player` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ckey` TEXT NOT NULL,
	`firstseen` TEXT NOT NULL,
	`lastseen` TEXT NOT NULL,
	`ip` TEXT NOT NULL,
	`computerid` TEXT NOT NULL,
	`lastadminrank` TEXT NOT NULL DEFAULT 'Player',
	`ooccolor` TEXT DEFAULT '#b82e00',
	`UI_style` TEXT DEFAULT 'Midnight',
	`UI_style_color` TEXT DEFAULT '#ffffff',
	`UI_style_alpha` INTEGER DEFAULT '255',
	`be_role` TEXT DEFAULT NULL,
	`default_slot` INTEGER DEFAULT '1',
	`toggles` INTEGER DEFAULT NULL,
	`toggles_2` INTEGER DEFAULT NULL,
	`sound` INTEGER DEFAULT '31',
	`volume_mixer` TEXT DEFAULT NULL,
	`lastchangelog` TEXT NOT NULL DEFAULT '0',
	`exp` TEXT DEFAULT NULL,
	`clientfps` INTEGER DEFAULT '63',
	`atklog` INTEGER DEFAULT '0',
	`fuid` INTEGER DEFAULT NULL,
	`fupdate` INTEGER DEFAULT '0',
	`parallax` INTEGER DEFAULT '8',
	`byond_date` DATE DEFAULT NULL,
	`2fa_status` TEXT NOT NULL DEFAULT 'DISABLED' COLLATE BINARY,
	`screentip_mode` INTEGER DEFAULT '8',
	`screentip_color` TEXT NOT NULL DEFAULT '#ffd391',
	`ghost_darkness_level` INTEGER NOT NULL DEFAULT '255',
	`colourblind_mode` TEXT NOT NULL DEFAULT 'None',
	UNIQUE (`ckey`)
);
CREATE TABLE `privacy` (
	`ckey` TEXT NOT NULL,
	`datetime` TEXT NOT NULL,
	`consent` INTEGER NOT NULL,
	PRIMARY KEY (`ckey`)
);
CREATE TABLE `karma_log` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`spendername` TEXT NOT NULL,
	`spenderkey` TEXT NOT NULL,
	`receivername` TEXT NOT NULL,
	`receiverkey` TEXT NOT NULL,
	`receiverrole` TEXT,
	`receiverspecial` TEXT,
	`isnegative` INTEGER DEFAULT NULL,
	`spenderip` TEXT NOT NULL,
	`server_id` TEXT NULL DEFAULT NULL,
	`time` TEXT NOT NULL
);
CREATE TABLE `karma_totals` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`byondkey` TEXT NOT NULL,
	`karma` INTEGER NOT NULL,
	`karmaspent` INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE `karma_purchases` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ckey` TEXT NOT NULL,
	`purchase` TEXT NOT NULL,
	`purchase_time` TEXT NOT NULL DEFAULT current_timestamp,
	UNIQUE (`ckey`, `purchase`)
);
CREATE TABLE `library` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`author` TEXT NOT NULL,
	`title` TEXT NOT NULL,
	`content` TEXT NOT NULL,
	`category` TEXT NOT NULL,
	`ckey` TEXT NOT NULL,
	`flagged` INTEGER NOT NULL
);
CREATE TABLE `legacy_population` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`playercount` INTEGER DEFAULT NULL,
	`admincount` INTEGER DEFAULT NULL,
	`server_id` TEXT NULL DEFAULT NULL,
	`time` TEXT NOT NULL
);
CREATE TABLE `watch` (
	`ckey` TEXT NOT NULL,
	`reason` TEXT NOT NULL,
	`timestamp` TEXT NOT NULL,
	`adminckey` TEXT NOT NULL,
	`last_editor` TEXT DEFAULT NULL,
	`edits` TEXT DEFAULT NULL,
	PRIMARY KEY (`ckey`)
);
CREATE TABLE `notes` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ckey` TEXT NOT NULL,
	`notetext` TEXT NOT NULL,
	`timestamp` TEXT NOT NULL,
	`round_id` INTEGER NULL DEFAULT NULL,
	`adminckey` TEXT NOT NULL,
	`last_editor` TEXT,
	`edits` TEXT,
	`server` TEXT NOT NULL,
	`crew_playtime` INTEGER DEFAULT '0',
	`automated` INTEGER NULL DEFAULT '0'
);
CREATE TABLE `memo` (
	`ckey` TEXT NOT NULL,
	`memotext` TEXT NOT NULL,
	`timestamp` TEXT NOT NULL,
	`last_editor` TEXT,
	`edits` TEXT,
	PRIMARY KEY (`ckey`)
);
CREATE TABLE `ipintel` (
	`ip` INTEGER NOT NULL,
	`date` TEXT DEFAULT current_timestamp NOT NULL,
	`intel` REAL NOT NULL DEFAULT '0',
	PRIMARY KEY (`ip`)
);
CREATE TABLE `vpn_whitelist` (
	`ckey` TEXT NOT NULL,
	`reason` TEXT,
	PRIMARY KEY (`ckey`)
);
CREATE TABLE `oauth_tokens` (
	`ckey` TEXT NOT NULL,
	`token` TEXT NOT NULL,
	PRIMARY KEY (`token`)
);
CREATE TABLE `playtime_history` (
	`ckey` TEXT NOT NULL,
	`date` DATE NOT NULL,
	`time_living` INTEGER NOT NULL,
	`time_ghost` INTEGER NOT NULL,
	PRIMARY KEY (`ckey`, `date`)
);
CREATE TABLE `connection_log` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`datetime` TEXT NOT NULL,
	`ckey` TEXT NOT NULL,
	`ip` TEXT NOT NULL,
	`computerid` TEXT NOT NULL,
	`server_id` TEXT NULL DEFAULT NULL,
	`result` TEXT NOT NULL DEFAULT 'ESTABLISHED' COLLATE BINARY
);
CREATE TABLE `changelog` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`pr_number` INTEGER NOT NULL,
	`date_merged` TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`author` TEXT NOT NULL,
	`cl_type` TEXT CHECK(`cl_type` IN ('FIX','WIP','TWEAK','SOUNDADD','SOUNDDEL','CODEADD','CODEDEL','IMAGEADD','IMAGEDEL','SPELLCHECK','EXPERIMENT')) NOT NULL,
	`cl_entry` TEXT NOT NULL
);
CREATE TABLE `ip2group` (
	`ip` TEXT NOT NULL,
	`date` TEXT DEFAULT current_timestamp NOT NULL,
	`groupstr` TEXT NOT NULL DEFAULT '',
	PRIMARY KEY (`ip`)
);
CREATE TABLE `round` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`initialize_datetime` TEXT NOT NULL,
	`start_datetime` TEXT NULL,
	`shutdown_datetime` TEXT NULL,
	`end_datetime` TEXT NULL,
	`server_ip` INTEGER NOT NULL,
	`server_port` INTEGER NOT NULL,
	`commit_hash` TEXT NULL,
	`game_mode` TEXT NULL,
	`game_mode_result` TEXT NULL,
	`end_state` TEXT NULL,
	`shuttle_name` TEXT NULL,
	`map_name` TEXT NULL,
	`station_name` TEXT NULL,
	`server_id` TEXT NULL
);
CREATE TABLE `2fa_secrets` (
	`ckey` TEXT NOT NULL PRIMARY KEY,
	`secret` TEXT NOT NULL,
	`date_setup` TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_time` TEXT NULL DEFAULT NULL
);
CREATE TABLE `pai_saves` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ckey` TEXT NOT NULL,
	`pai_name` TEXT NULL DEFAULT NULL,
	`description` TEXT NULL DEFAULT NULL,
	`preferred_role` TEXT NULL DEFAULT NULL,
	`ooc_comments` TEXT NULL DEFAULT NULL,
	UNIQUE(`ckey`)
);
CREATE TABLE `instance_data_cache` (
	`server_id` TEXT NOT NULL,
	`key_name` TEXT NOT NULL,
	`key_value` TEXT NOT NULL,
	`last_updated` TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`server_id`, `key_name`)
);

CREATE TRIGGER `instance_data_cache_update_timestamp`
AFTER UPDATE OF `server_id`, `key_name`, `key_value`
ON `instance_data_cache`
BEGIN
	UPDATE `instance_data_cache` SET `last_updated` = CURRENT_TIMESTAMP;
END;

CREATE INDEX "idx_notes_ckey" ON "notes" (`ckey`);
CREATE INDEX "idx_admin_ckey" ON "admin" (`ckey`);
CREATE INDEX "idx_library_ckey" ON "library" (`ckey`);
CREATE INDEX "idx_library_flagged" ON "library" (`flagged`);
CREATE INDEX "idx_oauth_tokens_ckey" ON "oauth_tokens" (`ckey`);
CREATE INDEX "idx_customuseritems_cuiCKey" ON "customuseritems" (`cuiCKey`);
CREATE INDEX "idx_characters_ckey" ON "characters" (`ckey`);
CREATE INDEX "idx_ban_ckey" ON "ban" (`ckey`);
CREATE INDEX "idx_ban_computerid" ON "ban" (`computerid`);
CREATE INDEX "idx_ban_ip" ON "ban" (`ip`);
CREATE INDEX "idx_admin_log_adminckey" ON "admin_log" (`adminckey`);
CREATE INDEX "idx_ip2group_groupstr" ON "ip2group" (`groupstr`);
CREATE INDEX "idx_connection_log_ckey" ON "connection_log" (`ckey`);
CREATE INDEX "idx_connection_log_ip" ON "connection_log" (`ip`);
CREATE INDEX "idx_connection_log_computerid" ON "connection_log" (`computerid`);
CREATE INDEX "idx_donators_ckey" ON "donators" (`ckey`);
CREATE INDEX "idx_karma_totals_byondkey" ON "karma_totals" (`byondkey`);
CREATE INDEX "idx_player_lastseen" ON "player" (`lastseen`);
CREATE INDEX "idx_player_computerid" ON "player" (`computerid`);
CREATE INDEX "idx_player_ip" ON "player" (`ip`);
CREATE INDEX "idx_player_fuid" ON "player" (`fuid`);
CREATE INDEX "idx_player_fupdate" ON "player" (`fupdate`);
END TRANSACTION;
