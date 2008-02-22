CREATE TABLE messages ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spoken_at" datetime DEFAULT NULL, "nick" varchar(255) DEFAULT NULL, "body" text DEFAULT NULL, "message_type" integer DEFAULT NULL);
CREATE TABLE schema_info (version integer);
INSERT INTO schema_info (version) VALUES (1)