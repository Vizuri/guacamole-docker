-- We use NULL as the salt, since these are know passwords anad not a long term user account; it's not a big security gap.  If the users change their pw
-- guacamole will set a salt.

\c guacamole
CREATE EXTENSION pgcrypto; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user00',digest('user00','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user01',digest('user01','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user02',digest('user02','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user03',digest('user03','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user04',digest('user04','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user05',digest('user05','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user06',digest('user06','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user07',digest('user07','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user08',digest('user08','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user09',digest('user09','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user10',digest('user10','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user11',digest('user11','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user12',digest('user12','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user13',digest('user13','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user14',digest('user14','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user15',digest('user15','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user16',digest('user16','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user17',digest('user17','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user18',digest('user18','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user19',digest('user19','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user20',digest('user20','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user21',digest('user21','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user22',digest('user22','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user23',digest('user23','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user24',digest('user24','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);
END;
