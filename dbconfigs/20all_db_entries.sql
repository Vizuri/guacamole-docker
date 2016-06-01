\c guacamole 

-- Add extention or else the digest function doesn't work.
CREATE EXTENSION pgcrypto; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user00',digest('user00','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user00-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA00','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA00.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training00');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB00','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB00.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training00');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC00','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC00.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training00');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END;

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user01',digest('user01','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user01-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA01','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA01.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training01');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB01','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB01.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training01');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC01','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC01.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training01');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user02',digest('user02','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user02-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA02','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA02.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training02');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB02','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB02.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training02');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC02','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC02.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training02');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user03',digest('user03','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user03-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA03','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA03.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training03');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB03','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB03.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training03');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC03','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC03.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training03');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user04',digest('user04','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user04-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA04','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA04.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training04');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB04','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB04.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training04');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC04','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC04.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training04');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user05',digest('user05','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user05-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA05','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA05.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training05');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB05','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB05.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training05');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC05','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC05.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training05');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user06',digest('user06','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user06-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA06','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA06.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training06');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB06','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB06.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training06');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC06','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC06.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training06');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user07',digest('user07','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user07-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA07','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA07.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training07');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB07','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB07.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training07');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC07','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC07.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training07');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user08',digest('user08','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user08-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA08','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA08.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training08');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB08','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB08.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training08');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC08','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC08.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training08');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user09',digest('user09','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user09-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA09','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA09.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training09');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB09','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB09.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training09');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC09','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC09.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training09');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user10',digest('user10','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user10-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA10','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA10.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training10');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB10','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB10.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training10');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC10','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC10.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training10');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user11',digest('user11','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user11-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA11','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA11.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training11');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB11','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB11.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training11');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC11','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC11.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training11');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user12',digest('user12','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user12-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA12','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA12.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training12');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB12','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB12.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training12');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC12','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC12.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training12');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user13',digest('user13','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user13-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA13','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA13.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training13');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB13','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB13.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training13');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC13','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC13.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training13');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user14',digest('user14','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user14-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA14','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA14.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training14');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB14','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB14.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training14');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC14','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC14.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training14');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user15',digest('user15','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user15-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA15','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA15.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training15');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB15','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB15.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training15');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC15','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC15.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training15');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user16',digest('user16','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user16-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA16','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA16.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training16');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB16','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB16.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training16');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC16','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC16.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training16');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user17',digest('user17','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user17-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA17','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA17.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training17');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB17','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB17.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training17');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC17','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC17.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training17');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user18',digest('user18','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user18-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA18','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA18.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training18');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB18','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB18.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training18');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC18','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC18.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training18');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user19',digest('user19','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user19-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA19','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA19.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training19');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB19','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB19.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training19');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC19','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC19.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training19');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user20',digest('user20','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user20-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA20','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA20.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training20');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB20','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB20.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training20');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC20','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC20.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training20');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user21',digest('user21','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user21-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA21','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA21.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training21');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB21','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB21.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training21');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC21','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC21.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training21');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user22',digest('user22','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user22-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA22','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA22.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training22');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB22','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB22.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training22');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC22','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC22.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training22');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user23',digest('user23','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user23-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA23','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA23.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training23');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB23','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB23.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training23');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC23','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC23.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training23');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user24',digest('user24','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user24-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA24','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA24.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training24');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB24','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB24.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training24');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC24','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC24.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training24');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 

BEGIN;
INSERT INTO guacamole_user (username, password_hash, password_salt, valid_until) VALUES('user25',digest('user25','sha256'),NULL,(CURRENT_DATE + '5 days'::interval)::date);

INSERT INTO guacamole_connection_group (connection_group_name, type) VALUES ('user25-hosts', 'ORGANIZATIONAL');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidA25','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidA25.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training25');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidB25','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidB25.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training25');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');

INSERT INTO guacamole_connection (connection_name, protocol, parent_id) VALUES ('fidC25','ssh',currval('guacamole_connection_group_connection_group_id_seq')); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'port','22'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'hostname','fidC25.training.vizuri.com'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'username','docker'); 
 INSERT INTO guacamole_connection_parameter VALUES(currval('guacamole_connection_connection_id_seq'),'password','training25');

INSERT INTO guacamole_connection_permission (user_id, connection_id, permission) 
  VALUES (currval('guacamole_user_user_id_seq'), currval('guacamole_connection_connection_id_seq'), 'READ');
END; 
