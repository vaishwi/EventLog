BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "event_details" (
	"event_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"club_id"	NUMERIC NOT NULL,
	"event_name"	TEXT NOT NULL,
	"event_date"	TEXT NOT NULL,
	"event_time"	INTEGER,
	"event_venue"	TEXT,
	"event_type"	TEXT,
	"event_desc"	TEXT,
	"event_poster"	BLOB,
	"event_reg_link"	TEXT,
	"event_reg_fee"	INTEGER,
	"event_reg_deadline"	TEXT NOT NULL,
	"isModified"	TEXT,
	"added_by"	INTEGER,
	"modification_date"	INTEGER,
	FOREIGN KEY("club_id") REFERENCES "club_details"("club_id")
);
CREATE TABLE IF NOT EXISTS "user_details" (
	"user_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_name"	TEXT NOT NULL,
	"user_mail"	TEXT NOT NULL,
	"isOrganizer"	INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS "organizer_details" (
	"organizer_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"club_id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	FOREIGN KEY("club_id") REFERENCES "club_details"("club_id"),
	FOREIGN KEY("user_id") REFERENCES "user_details"("user_id")
);
CREATE TABLE IF NOT EXISTS "club_details" (
	"club_id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"club_name"	TEXT NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "user_register_event_details" (
	"user_id"	INTEGER NOT NULL,
	"event_id"	INTEGER NOT NULL,
	FOREIGN KEY("event_id") REFERENCES "event_details"("event_id"),
	PRIMARY KEY("user_id","event_id"),
	FOREIGN KEY("user_id") REFERENCES "user_details"("user_id")
);
CREATE TABLE IF NOT EXISTS "event_organizer_details" (
	"organizer_id"	INTEGER NOT NULL,
	"event_id"	INTEGER NOT NULL,
	PRIMARY KEY("organizer_id","event_id"),
	FOREIGN KEY("organizer_id") REFERENCES "organizer_details"("organizer_id")
);
CREATE TABLE IF NOT EXISTS "interested_club" (
	"user_id"	INTEGER NOT NULL,
	"club_id"	INTEGER NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "user_details"("user_id"),
	FOREIGN KEY("club_id") REFERENCES "club_details"("club_id"),
	PRIMARY KEY("user_id","club_id")
);
INSERT INTO "event_details" VALUES (1,1,'Introduction Block Chain','2019-09-09','09:09','Auditorium','Technical','Spekaer: Adit Patel
He is blockchain specialist
','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz',20,'2019-09-09','false',9,NULL);
INSERT INTO "event_details" VALUES (2,1,'IP Rights','2020-09-09','09:09','Auditorium','Non Technical','Intal Actual Property rights is an very imporatant  rights you should have in case any new idea you have.','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz',100,'2020-09-09','false',10,NULL);
INSERT INTO "event_details" VALUES (3,2,'Thinking of your future','2020-04-27','09:09','Auditorium','Non Technical','No it''s time to think about your future.','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz',300,'2020-04-26','false',10,NULL);
INSERT INTO "event_details" VALUES (4,2,'Talk on Gsoc','2020-04-27','09:09','GICT 107','Technical','Google offeres this in summerand all the guildlines for register will be given','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz','NA','2020-04-26','false',10,NULL);
INSERT INTO "event_details" VALUES (5,3,'Webinar on web Scrapping','2020-09-09','09:09','Zoom','Technical','Web scrapping by daxeel soni','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz','NA','2020-09-09','false',2,NULL);
INSERT INTO "event_details" VALUES (6,3,'Introduction with Senior','2019-09-09','09:09','Room 009','Non Technical','Held by second and third year student for first year student','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz','NA','2019-09-09','false',2,NULL);
INSERT INTO "event_details" VALUES (7,4,'Webinar on Ethical Hacking','2019-09-09','09:09','Zoom','Technical','Ethical hacking by Nirali chavada','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz','NA','2019-09-09','flase',1,NULL);
INSERT INTO "event_details" VALUES (8,4,'IP and Innovation in Women','2020-09-09','09:09','Room 106','Non Technical','share experience by Nitika Saluja','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz','NA','2020-09-09','false',1,NULL);
INSERT INTO "event_details" VALUES (9,5,'Visit NGO','2020-04-27','09:09','NGO Ahmedabad','Non Technical','Visit NGO at ahmedabad','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz',100,'2020-04-26','false',3,NULL);
INSERT INTO "event_details" VALUES (11,5,'Distribute food packets','2020-04-27','09:09','Gulbai Tekara','Non Technical','Distribute food packets to thpse who doesn''t get even food','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz',100,'2020-04-26','false',3,NULL);
INSERT INTO "event_details" VALUES (12,6,'Colour RUN','2020-09-09','09:09','Round around GICT','Non Technical','Color run on holi, very exciting','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz',150,'2020-09-09','false',4,NULL);
INSERT INTO "event_details" VALUES (13,6,'Yoga Training','2019-09-09','09:09','GICT ground','Health','Yoga training by shivani patel','https://blogmedia.evbstatic.com/wp-content/uploads/wpmulti/sites/8/2018/01/15155312/iStock-667709450.jpg','https://shortdummy.xyz','NA','2019-09-09','true',4,NULL);
INSERT INTO "event_details" VALUES (14,7,'cake backing','nn','nn','Room 009','Cooking','cake backing live demo','nn','nn',50,'nn','false',5,NULL);
INSERT INTO "event_details" VALUES (15,7,'Salad Competition','nn','nn','AMSOM ground','Competition','You have to make an different and yummy salad to win the competition','nn','nn',100,'nn','false',5,NULL);
INSERT INTO "event_details" VALUES (16,8,'Cricket Match','nn','nn','Seas ground','Sport','Team decided based on selection','nn','nn','NA','nn','flase',11,NULL);
INSERT INTO "event_details" VALUES (17,8,'Football Match','nn','nn','Seas ground','Sport','Team decided based on selection','nn','nn','NA','nn','false',11,NULL);
INSERT INTO "event_details" VALUES (18,9,'Photo Walk','nn','nn','Rani ki Vav','Non Technical','You should bring your own camera','nn','nn','NA','nn','false',12,NULL);
INSERT INTO "event_details" VALUES (19,9,'Photo Competiton','nn','nn','Adalaj ni Vav','Competition','You should bring your own camera','nn','nn','NA','nn','true',12,NULL);
INSERT INTO "event_details" VALUES (20,10,'Python Programming Quiz','nn','nn','Room 009','Technical','Python buddies can participate','nn','nn','NA','nn','false',13,NULL);
INSERT INTO "event_details" VALUES (21,10,'Friends Quiz','nn','nn','Room 008','Non Technical','"Friends" buddies can participate','nn','nn','NA','nn','false',13,NULL);
INSERT INTO "user_details" VALUES (1,'Vaishwi','vaishwipatel82110',1);
INSERT INTO "user_details" VALUES (2,'krinali','krinalishah1901',1);
INSERT INTO "user_details" VALUES (3,'arpit','arpitpatel',1);
INSERT INTO "user_details" VALUES (4,'foram','foramvadher',1);
INSERT INTO "user_details" VALUES (5,'sumit','sumit.p@ahduni.edu.in',1);
INSERT INTO "user_details" VALUES (6,'muskan','muskanmatwani',0);
INSERT INTO "user_details" VALUES (7,'dhruvil','dhruvilshah',0);
INSERT INTO "user_details" VALUES (8,'kushroo','kushroodoctor',0);
INSERT INTO "user_details" VALUES (9,'sanjay','sanjaychaudhary',1);
INSERT INTO "user_details" VALUES (10,'Rahul Bhathiji','rahulbhathiji',1);
INSERT INTO "user_details" VALUES (11,'Kavita Nayer','kavita.n@ahduni.edu.in',1);
INSERT INTO "user_details" VALUES (12,'Divith Chhajed','divithChhajed',1);
INSERT INTO "user_details" VALUES (13,'Aashna Bilgi','aashnaBilgi',1);
INSERT INTO "user_details" VALUES (14,'Tirth Jivani','tirthJivani',0);
INSERT INTO "user_details" VALUES (15,'Krushan Shah','krushnaShah',0);
INSERT INTO "organizer_details" VALUES (1,1,9);
INSERT INTO "organizer_details" VALUES (2,1,10);
INSERT INTO "organizer_details" VALUES (3,2,10);
INSERT INTO "organizer_details" VALUES (4,3,2);
INSERT INTO "organizer_details" VALUES (5,4,1);
INSERT INTO "organizer_details" VALUES (6,5,3);
INSERT INTO "organizer_details" VALUES (7,6,4);
INSERT INTO "organizer_details" VALUES (8,7,5);
INSERT INTO "organizer_details" VALUES (9,8,11);
INSERT INTO "organizer_details" VALUES (10,9,12);
INSERT INTO "organizer_details" VALUES (11,10,13);
INSERT INTO "club_details" VALUES (1,'Workshop');
INSERT INTO "club_details" VALUES (2,'Talk');
INSERT INTO "club_details" VALUES (3,'IEEE SB');
INSERT INTO "club_details" VALUES (4,'IEEE WIE');
INSERT INTO "club_details" VALUES (5,'Social Service Forum');
INSERT INTO "club_details" VALUES (6,'Fitness Club');
INSERT INTO "club_details" VALUES (7,'Food Club');
INSERT INTO "club_details" VALUES (8,'Sports Club');
INSERT INTO "club_details" VALUES (9,'Photography Club');
INSERT INTO "club_details" VALUES (10,'Quiz Club');
INSERT INTO "user_register_event_details" VALUES (1,1);
INSERT INTO "user_register_event_details" VALUES (1,2);
INSERT INTO "user_register_event_details" VALUES (2,4);
INSERT INTO "user_register_event_details" VALUES (2,5);
INSERT INTO "user_register_event_details" VALUES (2,11);
INSERT INTO "user_register_event_details" VALUES (3,2);
INSERT INTO "user_register_event_details" VALUES (3,4);
INSERT INTO "user_register_event_details" VALUES (3,9);
INSERT INTO "user_register_event_details" VALUES (4,9);
INSERT INTO "user_register_event_details" VALUES (4,2);
INSERT INTO "user_register_event_details" VALUES (4,1);
INSERT INTO "user_register_event_details" VALUES (4,6);
INSERT INTO "user_register_event_details" VALUES (4,12);
INSERT INTO "user_register_event_details" VALUES (5,12);
INSERT INTO "user_register_event_details" VALUES (5,11);
INSERT INTO "user_register_event_details" VALUES (5,13);
INSERT INTO "user_register_event_details" VALUES (5,5);
INSERT INTO "user_register_event_details" VALUES (5,3);
INSERT INTO "user_register_event_details" VALUES (6,3);
INSERT INTO "user_register_event_details" VALUES (6,1);
INSERT INTO "user_register_event_details" VALUES (6,11);
INSERT INTO "user_register_event_details" VALUES (6,13);
INSERT INTO "user_register_event_details" VALUES (6,9);
INSERT INTO "user_register_event_details" VALUES (6,4);
INSERT INTO "user_register_event_details" VALUES (7,4);
INSERT INTO "user_register_event_details" VALUES (7,1);
INSERT INTO "user_register_event_details" VALUES (7,3);
INSERT INTO "user_register_event_details" VALUES (7,5);
INSERT INTO "user_register_event_details" VALUES (7,6);
INSERT INTO "user_register_event_details" VALUES (7,12);
INSERT INTO "user_register_event_details" VALUES (8,12);
INSERT INTO "user_register_event_details" VALUES (8,2);
INSERT INTO "user_register_event_details" VALUES (8,8);
INSERT INTO "user_register_event_details" VALUES (8,9);
INSERT INTO "user_register_event_details" VALUES (8,13);
INSERT INTO "user_register_event_details" VALUES (9,13);
INSERT INTO "user_register_event_details" VALUES (9,11);
INSERT INTO "user_register_event_details" VALUES (9,9);
INSERT INTO "user_register_event_details" VALUES (9,6);
INSERT INTO "user_register_event_details" VALUES (9,3);
INSERT INTO "user_register_event_details" VALUES (9,1);
INSERT INTO "user_register_event_details" VALUES (10,1);
INSERT INTO "user_register_event_details" VALUES (10,12);
INSERT INTO "user_register_event_details" VALUES (10,4);
INSERT INTO "user_register_event_details" VALUES (10,6);
INSERT INTO "user_register_event_details" VALUES (10,8);
INSERT INTO "user_register_event_details" VALUES (10,11);
INSERT INTO "event_organizer_details" VALUES (1,1);
INSERT INTO "event_organizer_details" VALUES (2,2);
INSERT INTO "event_organizer_details" VALUES (3,3);
INSERT INTO "event_organizer_details" VALUES (3,4);
INSERT INTO "event_organizer_details" VALUES (4,5);
INSERT INTO "event_organizer_details" VALUES (4,6);
INSERT INTO "event_organizer_details" VALUES (5,7);
INSERT INTO "event_organizer_details" VALUES (5,8);
INSERT INTO "event_organizer_details" VALUES (6,9);
INSERT INTO "event_organizer_details" VALUES (6,11);
INSERT INTO "event_organizer_details" VALUES (7,12);
INSERT INTO "event_organizer_details" VALUES (7,13);
INSERT INTO "event_organizer_details" VALUES (8,14);
INSERT INTO "event_organizer_details" VALUES (8,15);
INSERT INTO "event_organizer_details" VALUES (9,16);
INSERT INTO "event_organizer_details" VALUES (9,17);
INSERT INTO "event_organizer_details" VALUES (10,18);
INSERT INTO "event_organizer_details" VALUES (10,19);
INSERT INTO "event_organizer_details" VALUES (11,20);
INSERT INTO "event_organizer_details" VALUES (11,21);
INSERT INTO "interested_club" VALUES (1,3);
INSERT INTO "interested_club" VALUES (3,4);
INSERT INTO "interested_club" VALUES (4,1);
INSERT INTO "interested_club" VALUES (4,2);
INSERT INTO "interested_club" VALUES (3,2);
INSERT INTO "interested_club" VALUES (2,4);
INSERT INTO "interested_club" VALUES (2,1);
INSERT INTO "interested_club" VALUES (2,3);
INSERT INTO "interested_club" VALUES (2,2);
INSERT INTO "interested_club" VALUES (5,1);
INSERT INTO "interested_club" VALUES (5,4);
INSERT INTO "interested_club" VALUES (5,3);
INSERT INTO "interested_club" VALUES (5,2);
COMMIT;
