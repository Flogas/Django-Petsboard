BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "bboard_rubric" (
	"id"	integer NOT NULL,
	"name"	varchar(20) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "bboard_bb" (
	"id"	integer NOT NULL,
	"title"	varchar(50) NOT NULL,
	"content"	text,
	"price"	real,
	"published"	datetime NOT NULL,
	"rubric_id"	integer,
	"phone"	varchar(12) NOT NULL,
	"image"	Image,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("rubric_id") REFERENCES "bboard_rubric"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2019-09-05 21:48:14.393420');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2019-09-05 21:48:14.547023');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2019-09-05 21:48:14.673521');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2019-09-05 21:48:14.835602');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2019-09-05 21:48:14.964957');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2019-09-05 21:48:15.094000');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2019-09-05 21:48:15.187548');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2019-09-05 21:48:15.286731');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2019-09-05 21:48:15.422991');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2019-09-05 21:48:15.519905');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2019-09-05 21:48:15.593515');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2019-09-05 21:48:15.697238');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2019-09-05 21:48:15.767911');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2019-09-05 21:48:15.863753');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2019-09-05 21:48:15.949016');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2019-09-05 21:48:16.035500');
INSERT INTO "django_migrations" VALUES (17,'bboard','0001_initial','2019-09-05 21:48:16.110253');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2019-09-05 21:48:16.212727');
INSERT INTO "django_migrations" VALUES (19,'bboard','0002_auto_20190920_1431','2019-09-20 14:33:07.752109');
INSERT INTO "django_admin_log" VALUES (6,'2020-04-30 15:06:13.485474','1','admin','',2,2,3);
INSERT INTO "django_admin_log" VALUES (7,'2020-04-30 15:25:57.156240','9','Bb object (9)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (8,'2020-04-30 15:25:59.608340','8','Bb object (8)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (9,'2020-04-30 15:25:59.672331','7','Bb object (7)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (10,'2020-04-30 15:25:59.730320','6','Bb object (6)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (11,'2020-04-30 15:25:59.811300','5','Bb object (5)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (12,'2020-04-30 15:25:59.885912','4','Bb object (4)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (13,'2020-04-30 15:25:59.952336','2','Bb object (2)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (14,'2020-04-30 15:26:00.029333','1','Bb object (1)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (15,'2020-04-30 15:26:17.391054','1','Газета','',8,2,3);
INSERT INTO "django_admin_log" VALUES (16,'2020-04-30 15:26:17.490323','2','Машины','',8,2,3);
INSERT INTO "django_admin_log" VALUES (17,'2020-04-30 15:26:26.654492','3','Кошки','[{"added": {}}]',8,2,1);
INSERT INTO "django_admin_log" VALUES (18,'2020-04-30 15:26:30.521682','4','Собаки','[{"added": {}}]',8,2,1);
INSERT INTO "django_admin_log" VALUES (19,'2020-04-30 15:26:34.132103','5','Хомяки','[{"added": {}}]',8,2,1);
INSERT INTO "django_admin_log" VALUES (20,'2020-04-30 15:26:43.431443','6','Попугаи','[{"added": {}}]',8,2,1);
INSERT INTO "django_admin_log" VALUES (21,'2020-04-30 15:30:32.484323','11','Bb object (11)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (22,'2020-04-30 15:30:34.952344','10','Bb object (10)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (23,'2020-05-05 15:58:00.959909','16','Bb object (16)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (24,'2020-05-05 15:58:03.408912','15','Bb object (15)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (25,'2020-05-05 15:58:03.488911','14','Bb object (14)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (26,'2020-05-05 15:58:03.569916','13','Bb object (13)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (27,'2020-05-05 15:58:03.637917','12','Bb object (12)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (28,'2020-05-05 16:15:04.387825','18','Bb object (18)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (29,'2020-05-05 16:15:06.799041','17','Bb object (17)','',7,2,3);
INSERT INTO "django_admin_log" VALUES (61,'2023-11-11 14:30:13.108436','11','Blabla','',2,21,3);
INSERT INTO "django_admin_log" VALUES (62,'2023-11-11 14:30:13.196481','13','Hohoho','',2,21,3);
INSERT INTO "django_admin_log" VALUES (63,'2023-11-11 14:30:13.296425','18','Iluxa','',2,21,3);
INSERT INTO "django_admin_log" VALUES (64,'2023-11-11 14:30:13.421422','12','Ilya','',2,21,3);
INSERT INTO "django_admin_log" VALUES (65,'2023-11-11 14:30:13.512502','16','Kostireva','',2,21,3);
INSERT INTO "django_admin_log" VALUES (66,'2023-11-11 14:30:13.613421','15','Lexa','',2,21,3);
INSERT INTO "django_admin_log" VALUES (67,'2023-11-11 14:30:13.704432','19','Sofya228','',2,21,3);
INSERT INTO "django_admin_log" VALUES (68,'2023-11-11 14:30:13.805422','17','Tsuga','',2,21,3);
INSERT INTO "django_admin_log" VALUES (69,'2023-11-11 14:30:13.896496','20','admin','',2,21,3);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','user');
INSERT INTO "django_content_type" VALUES (3,'auth','permission');
INSERT INTO "django_content_type" VALUES (4,'auth','group');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'bboard','bb');
INSERT INTO "django_content_type" VALUES (8,'bboard','rubric');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,4,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (6,4,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (7,4,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (8,4,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (9,2,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (10,2,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (11,2,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (12,2,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (13,3,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (14,3,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (15,3,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (16,3,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_bb','Can add bb');
INSERT INTO "auth_permission" VALUES (26,7,'change_bb','Can change bb');
INSERT INTO "auth_permission" VALUES (27,7,'delete_bb','Can delete bb');
INSERT INTO "auth_permission" VALUES (28,7,'view_bb','Can view bb');
INSERT INTO "auth_permission" VALUES (29,8,'add_rubric','Can add Рубрика');
INSERT INTO "auth_permission" VALUES (30,8,'change_rubric','Can change Рубрика');
INSERT INTO "auth_permission" VALUES (31,8,'delete_rubric','Can delete Рубрика');
INSERT INTO "auth_permission" VALUES (32,8,'view_rubric','Can view Рубрика');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$180000$QIWBclukN1rc$M4HoXqAuwRnPq3xqPzw/I0HlLUqbIvjOXXt0H2uz0u0=','2020-04-30 15:05:09.240502',1,'Admin','','mercyboxx@gmail.com',1,1,'2020-04-30 15:03:52.113287','');
INSERT INTO "auth_user" VALUES (21,'pbkdf2_sha256$600000$lyJLe2t2cSmvTRTNSSz1Cw$ohuK2kSclqKBsdqKtGDkTrNPx/ocqJVU3tZOm9KcAao=','2023-11-11 15:03:23.401508',1,'adm','','kuryan.ilya@mail.ru',1,1,'2023-11-11 14:28:58.763292','');
INSERT INTO "auth_user" VALUES (22,'pbkdf2_sha256$600000$iIwztg6LfHPfmGkBEnOrx7$F763OhUg+FhlJbwhBJQGg7Dd2QIOGV6u3F7/YarEHVA=','2023-11-15 15:05:52.913038',0,'ilya','','',0,1,'2023-11-15 15:05:45.911567','');
INSERT INTO "auth_user" VALUES (23,'pbkdf2_sha256$600000$asTUYnQ9IvU68weqBMWJHj$HWVz+icpzMPAGdLjeUGAWilXOoOpdyUmTJDEEGKi6j0=','2023-12-09 09:27:49.039855',0,'Ilya123','','',0,1,'2023-12-09 09:27:37.368856','');
INSERT INTO "django_session" VALUES ('jy8f57dlh8eng3vsxmcgp5n1nwizig9u','NjQ3NWRlMmIxYjBkMTgxMDRlYmVmYTg1OTg4MWM0ZTYzOGE0NWE4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI2MDc3Yzc1N2MwZDQ1ZTRhN2I1Yzc0MDhiZGUzZTAwMTQzOWI2YmE4In0=','2019-10-03 19:33:35.353452');
INSERT INTO "django_session" VALUES ('qg6dtifex2q0gf8a2q9x4t8fot8hc8hy','NGVhMzUxMTIxYzQ0Yzk0ZDQ5OTc5NWI3MDFiOTAxMTRlZjJhMWU3Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTVkOGVhZDk1NWE4MjY1ODhkYmI2YTg5NTc0ZGQwYmZjZTg4MWE3In0=','2020-05-14 15:05:08.724400');
INSERT INTO "django_session" VALUES ('hw2ljefm9blpmzjjd96v1wqxlixipueh','NGVhMzUxMTIxYzQ0Yzk0ZDQ5OTc5NWI3MDFiOTAxMTRlZjJhMWU3Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZTVkOGVhZDk1NWE4MjY1ODhkYmI2YTg5NTc0ZGQwYmZjZTg4MWE3In0=','2020-05-14 15:05:09.299502');
INSERT INTO "django_session" VALUES ('ex7fstwpy32ucti25f6vi3xc9n8bwmhz','MmJlODNkZjhlZDc3YWJmNGM1NGFmMzk3Nzg2NGE0MzQyOTMyNDlhYTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOWUyOWI2N2U4YTAwOTJlMzZmZjgwNmUzY2NkMmUwM2ExMTYyM2U4In0=','2020-06-01 14:58:14.367479');
INSERT INTO "django_session" VALUES ('f3zrh9mlqs37hto2vycd7xt3uoui0v0m','MGI2ZWM3OWZlYzEzY2RhZWUzOTYzNzQwOTdkZGM2MzMxNzExZTllODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOTIwZDMwYmVmNjM3NjNhMTVjZjYwOWFkYjk4ZDQxMDNlZDVmMGI0In0=','2020-06-01 15:49:35.800366');
INSERT INTO "django_session" VALUES ('mkindmtk6xg3nci5tg47l3lceb78rtgc','MGI2ZWM3OWZlYzEzY2RhZWUzOTYzNzQwOTdkZGM2MzMxNzExZTllODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOTIwZDMwYmVmNjM3NjNhMTVjZjYwOWFkYjk4ZDQxMDNlZDVmMGI0In0=','2020-06-05 18:40:24.345776');
INSERT INTO "django_session" VALUES ('mhalr1y4oaslmeewu5u992c2ubmg0srd','NDMxYWRjMDEzMzZhM2JiOTZmNzhiNzFmNzVkYjNkNmU5YzM2OTdlYTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTYyYWZiYWUyN2Y5NzBlOTBiNWJiNGZhNGJkYjI3Yzc4MjA3ZTk3YSJ9','2020-06-16 06:07:33.123689');
INSERT INTO "django_session" VALUES ('dcbrx8agyjzh5a90ix3yiaop7w7078ju','NDMxYWRjMDEzMzZhM2JiOTZmNzhiNzFmNzVkYjNkNmU5YzM2OTdlYTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTYyYWZiYWUyN2Y5NzBlOTBiNWJiNGZhNGJkYjI3Yzc4MjA3ZTk3YSJ9','2020-06-16 06:37:16.940597');
INSERT INTO "django_session" VALUES ('kl0p17ey86swb9sxp0zor2vhxfzd86fh','NDMxYWRjMDEzMzZhM2JiOTZmNzhiNzFmNzVkYjNkNmU5YzM2OTdlYTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTYyYWZiYWUyN2Y5NzBlOTBiNWJiNGZhNGJkYjI3Yzc4MjA3ZTk3YSJ9','2020-06-16 10:43:40.006604');
INSERT INTO "django_session" VALUES ('3fgg6csv8f6on24vnov2wy0zdggosiyj','NmQ2MzE0Y2IyZTQwMmYxZTNmZmQ3MGNlMTcxMjNkYzMxYTY0Y2M4YTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjE1MTRjYzRhNjAwZTY3ZmFkNzc2ZDg1YjgyMTNkMjkwOGE5ODZhZiJ9','2020-06-16 10:46:06.051256');
INSERT INTO "django_session" VALUES ('qitqqg8yxwrpkeva8j99ejc16wm9pino','OGFmN2ZjMDA1NWI2NzdmMjgwMDUzM2I0MjNhZGYwZGE3NmQ0OTVkZjp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDlkMmZkYzU5MzQ2Y2FjNzEyOTEzZjgxYmViNmU1MzY4ZDM4YmMxMCJ9','2020-10-17 17:31:02.951888');
INSERT INTO "django_session" VALUES ('fqkaoksyqjmrgt4qy3cetjr5h4f2qviw','NjdiOGRiMTVkYzdlODZjYzQ3ODc1NjE1ZGQxM2JlZGViNTc4OThjNzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWE0Yzg2ODNhZWEwMmI3MmUwZWZiNzk5NjJmZmIyYTdlZTY1ODRiMSJ9','2020-12-29 16:38:24.565959');
INSERT INTO "django_session" VALUES ('xuzmu8op2p2bi9bz769z4dyljv5ptik8','.eJxVjMsOgjAUBf-la9P0lpaiS_d8A7kvBDVtQmFl_HclYaHbMzPnZQbc1mnYqi7DLOZioDOn35GQH5p3InfMt2K55HWZye6KPWi1fRF9Xg_372DCOn1rFhFS1zn2KSVRIYCRGxiDb1giESBTolajA-eVE6ZAYwsOQzxT7Mz7A0MAOQk:1nNHry:I3rldTNXB7epzsAMirY5FlMwZ7cuuIg2Vgu1rQc3T8g','2022-03-10 17:25:34.196923');
INSERT INTO "bboard_rubric" VALUES (3,'Кошки');
INSERT INTO "bboard_rubric" VALUES (4,'Собаки');
INSERT INTO "bboard_rubric" VALUES (5,'Хомяки');
INSERT INTO "bboard_rubric" VALUES (6,'Попугаи');
INSERT INTO "bboard_rubric" VALUES (7,'Рептилии');
INSERT INTO "bboard_rubric" VALUES (8,'Другие');
INSERT INTO "bboard_rubric" VALUES (9,'Кролики');
INSERT INTO "bboard_bb" VALUES (6,'Кролик','Отдам за символическую плату кролика, родился 3 месяца назад.',100.0,'2020-05-19 05:49:31.717158',9,'+79879895612','images/64NoyYk_sw8.jpg');
INSERT INTO "bboard_bb" VALUES (7,'Малыши Эублефары (геккон)','В продаже уже появились малыши Эублефара, разных возрастов и разных морф.
Все что вам нужно знать, я обязательно расскажу и покажу при встрече.
В уходе малыши не прихотливы, и не затратны, а главное - НЕ АЛЛЕРГЕННЫ! живут в квартирных условиях очень долго, до 15-20 лет. Наличие террариума не обязательно.',2500.0,'2020-05-19 05:50:50.538417',7,'+78998989652','images/MdWnKqaiRBk.jpg');
INSERT INTO "bboard_bb" VALUES (8,'Кошечка','Нашли на улице кошечку, дома держать не можем, так так у сами уже есть кот. Отдадим в добрые руки.',1.0,'2020-05-19 05:55:11.999621',3,'+79898984545','images/-ZEV5u6UOAc.jpg');
INSERT INTO "bboard_bb" VALUES (9,'Хомячки','Хомяк Сирийский. Кличка Хома. купили 2 месяца назад, дочке на др.
Клетка. тоже отдаем.
Шар если нужен только сломан и корм',50.0,'2020-05-19 05:57:07.532340',5,'+79885961322','images/9BOMSAaVMfM.jpg');
INSERT INTO "bboard_bb" VALUES (10,'Пёсик','Отдам ласкового малыша в добрые руки. Привит, паспорт на руках. Очень добрый',1.0,'2020-05-19 05:58:30.629411',4,'+79896132211','images/NqDqvKq_GLA_oLpnNws.jpg');
INSERT INTO "bboard_bb" VALUES (11,'Котик','Милый, ласковый, очень добрый. Отдам в добрые руки.',2.0,'2020-05-19 06:02:06.846272',3,'+79089425617','images/PyM_AEp_2aU_22NQZRm.jpg');
INSERT INTO "bboard_bb" VALUES (18,'Чук','Продам чука',12321412.0,'2020-10-03 17:29:30.238499',5,'+79133171142','images/00049998.jpg');
INSERT INTO "bboard_bb" VALUES (19,'Пони','Продаю пони',1488.0,'2020-12-15 16:39:18.182963',8,'+78005553535','images/0_50ea3_418102cf_XL.png');
INSERT INTO "bboard_bb" VALUES (21,'Отдам в добрые руки!!!!','Милый попугай ищет дом, возьмите его к себе!',0.0,'2023-09-24 07:58:36.472306',6,'+79998004466','images/lb4mPwaPVzo.jpg');
INSERT INTO "bboard_bb" VALUES (23,'Отдам Шлепу','Большой русский кот в добрые руки!',0.0,'2023-11-15 15:06:37.774415',3,'88005553535','images/5iRgh_G0eRY.png');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "bboard_rubric_name_e1a5d9b7" ON "bboard_rubric" (
	"name"
);
CREATE INDEX IF NOT EXISTS "bboard_bb_published_58fde1b5" ON "bboard_bb" (
	"published"
);
CREATE INDEX IF NOT EXISTS "bboard_bb_rubric_id_09f205a2" ON "bboard_bb" (
	"rubric_id"
);
COMMIT;
