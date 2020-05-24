--
-- Use this to set up some basics for testing
--

INSERT INTO users (email) VALUES ('rsterbin@gmail.com');
INSERT INTO games (name, user_id, slug, uuid)
    VALUES ('Test Game', 1, 'test-game', '15d78c19-7ee6-4d9d-9a86-312200e19e26');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/thor.jpg');
INSERT INTO players (user_id, game_id, is_dm, player_name, icon_id, color)
    VALUES (1, 1, TRUE, 'Reha', 1, '#cc33cc');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/roy_oots_6515.png');
INSERT INTO players (game_id, char_full_name, char_short_name, char_pronouns_id, player_name, icon_id, color)
    VALUES (1, 'Roy Greenhilt', 'Roy', 2, 'Mike', 2, '#2d5487');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/haley_oots_5397.png');
INSERT INTO players (game_id, char_full_name, char_short_name, char_pronouns_id, player_name, icon_id, color)
    VALUES (1, 'Haley Starshine', 'Haley', 1, 'Jessica', 3, '#f68b33');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/vaarsuvius_7277.jpg');
INSERT INTO players (game_id, char_full_name, char_short_name, char_pronouns_id, player_name, icon_id, color)
    VALUES (1, 'Vaarsuvius', 'Vaarsuvius', 3, 'Taylor', 4, '#a53220');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/durkon_oots_4575.jpg');
INSERT INTO players (game_id, char_full_name, char_short_name, char_pronouns_id, player_name, icon_id, color)
    VALUES (1, 'Durkon Thundershield', 'Durkon', 2, 'Chris', 5, '#9a9b9f');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/elan_oots_2958.jpg');
INSERT INTO players (game_id, char_full_name, char_short_name, char_pronouns_id, player_name, icon_id, color)
    VALUES (1, 'Elan', 'Elan', 2, 'Ashley', 6, '#fff450');
INSERT INTO icons (url) VALUES ('http://localhost:3000/fake-external/belkar_oots_3884.png');
INSERT INTO players (game_id, char_full_name, char_short_name, char_pronouns_id, player_name, icon_id, color)
    VALUES (1, 'Belkar Bitterleaf', 'Belkar', 2, 'Heather', 7, '#00472a');
INSERT INTO icons (url) VALUES ('LOCAL_ICONS/d20_20.png');
INSERT INTO game_events (game_id, full_name, short_name, icon_id, color, dm_only)
    VALUES (1, 'Natural 20', 'nat20', 8, '#f4917b', false);
INSERT INTO icons (url) VALUES ('LOCAL_ICONS/d20_1.png');
INSERT INTO game_events (game_id, full_name, short_name, icon_id, color, dm_only)
    VALUES (1, 'Natural 1', 'nat1', 9, '#384850', false);
INSERT INTO icons (url) VALUES ('LOCAL_ICONS/monster.png');
INSERT INTO game_events (game_id, full_name, short_name, icon_id, color, dm_only)
    VALUES (1, 'Enemy Defeated', 'enemyx', 10, '#faf8f6', true);
INSERT INTO icons (url) VALUES ('LOCAL_ICONS/eyeroll.png');
INSERT INTO game_events (game_id, full_name, short_name, icon_id, color, dm_only)
    VALUES (1, 'Bad Pun', 'pun', 11, '#f9c548', false);
INSERT INTO icons (url) VALUES ('LOCAL_ICONS/cat.png');
INSERT INTO game_events (game_id, full_name, short_name, icon_id, color, dm_only)
    VALUES (1, 'Cat on the Table', 'cat', 12, '#be6224', true);
INSERT INTO users (email) VALUES ('testy@example.com');
INSERT INTO sponsors (user_id, game_id, max_donation)
    VALUES (2, 1, '50.00');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (1, 1, NULL, '0.50');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (1, 3, NULL, '10.00');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (1, 4, NULL, '5.00');
INSERT INTO users (email) VALUES ('testy2@example.com');
INSERT INTO sponsors (user_id, game_id, max_donation)
    VALUES (3, 1, '25.00');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (2, 1, 2, '4.00');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (2, 2, 2, '10.00');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (2, 3, NULL, '5.00');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (2, 4, 6, '0.05');
INSERT INTO sponsored_events (sponsor_id, event_id, player_id, donation)
    VALUES (2, 5, NULL, '3.50');

