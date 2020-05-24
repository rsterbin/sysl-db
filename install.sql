--
-- Set up the tables for SYSL
--

CREATE TABLE pronouns (
    pronouns_id serial NOT NULL,
    subject text NOT NULL,
    object text NOT NULL,
    possessive text NOT NULL,
    determiner text NOT NULL,
    reflexive text NOT NULL,
    CONSTRAINT pronouns_pk PRIMARY KEY (pronouns_id)
);

INSERT INTO pronouns (subject, object, possessive, determiner, reflexive) VALUES ('she', 'her', 'hers', 'her', 'herself');
INSERT INTO pronouns (subject, object, possessive, determiner, reflexive) VALUES ('he', 'him', 'his', 'his', 'himself');
INSERT INTO pronouns (subject, object, possessive, determiner, reflexive) VALUES ('they', 'them', 'theirs', 'their', 'themself');

CREATE TABLE users (
    user_id serial NOT NULL,
    email text NOT NULL,
    password text,
    first text,
    last text,
    address1 text,
    address2 text,
    city text,
    region text,
    postal_code text,
    country text,
    pronouns_id integer,
    occupation text,
    employer text,
    CONSTRAINT users_pk PRIMARY KEY (user_id),
    CONSTRAINT users_email_uq UNIQUE (email),
    CONSTRAINT users_pronouns_id_fk FOREIGN KEY (pronouns_id)
        REFERENCES pronouns (pronouns_id) MATCH SIMPLE
);

CREATE INDEX users_email_idx ON users (email);

CREATE TABLE games (
    game_id serial NOT NULL,
    name text NOT NULL,
    user_id integer NOT NULL,
    slug text NOT NULL,
    uuid text NOT NULL,
    CONSTRAINT games_pk PRIMARY KEY (game_id),
    CONSTRAINT games_user_id_fk FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
        ON DELETE CASCADE
);

CREATE INDEX games_user_id_idx ON games (user_id);

CREATE TABLE icons (
    icon_id serial NOT NULL,
    url text NOT NULL,
    user_id integer,
    CONSTRAINT icons_pk PRIMARY KEY (icon_id)
);

CREATE TABLE players (
    player_id serial NOT NULL,
    game_id integer NOT NULL,
    user_id integer,
    is_dm boolean NOT NULL DEFAULT FALSE,
    char_full_name text,
    char_short_name text,
    char_pronouns_id integer,
    player_name text,
    icon_id integer NOT NULL,
    color text NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY (player_id),
    CONSTRAINT players_game_id_fk FOREIGN KEY (game_id)
        REFERENCES games (game_id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT players_user_id_fk FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
        ON DELETE SET NULL,
    CONSTRAINT players_char_pronouns_id_fk FOREIGN KEY (char_pronouns_id)
        REFERENCES pronouns (pronouns_id) MATCH SIMPLE
        ON DELETE SET NULL,
    CONSTRAINT players_icon_id_fk FOREIGN KEY (icon_id)
        REFERENCES icons (icon_id) MATCH SIMPLE
);

CREATE TABLE game_events (
    event_id serial NOT NULL,
    game_id integer NOT NULL,
    full_name text NOT NULL,
    short_name text NOT NULL,
    icon_id integer NOT NULL,
    color text NOT NULL,
    dm_only boolean NOT NULL DEFAULT FALSE,
    CONSTRAINT game_events_pk PRIMARY KEY (event_id),
    CONSTRAINT game_events_game_id_fk FOREIGN KEY (game_id)
        REFERENCES games (game_id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT game_events_icon_id_fk FOREIGN KEY (icon_id)
        REFERENCES icons (icon_id) MATCH SIMPLE
);

CREATE TABLE sponsors (
    sponsor_id serial NOT NULL,
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    max_donation decimal(12,2),
    CONSTRAINT sponsors_pk PRIMARY KEY (sponsor_id),
    CONSTRAINT sponsors_user_id_fk FOREIGN KEY (user_id)
        REFERENCES users (user_id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT sponsors_game_id_fk FOREIGN KEY (game_id)
        REFERENCES games (game_id) MATCH SIMPLE
        ON DELETE CASCADE
);

CREATE TABLE sponsored_events (
    sponsor_id integer NOT NULL,
    event_id integer NOT NULL,
    player_id integer,
    donation decimal(12,2) NOT NULL,
    CONSTRAINT sponsored_events_pk PRIMARY KEY (sponsor_id, event_id),
    CONSTRAINT sponsored_events_sponsor_id_fk FOREIGN KEY (sponsor_id)
        REFERENCES sponsors (sponsor_id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT sponsored_events_event_id_fk FOREIGN KEY (event_id)
        REFERENCES game_events (event_id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT sponsored_events_player_id_fk FOREIGN KEY (player_id)
        REFERENCES players (player_id) MATCH SIMPLE
        ON DELETE CASCADE
);

CREATE TABLE play_log (
    log_id serial NOT NULL,
    player_id integer NOT NULL,
    event_id integer NOT NULL,
    play_time timestamp with time zone NOT NULL DEFAULT NOW(),
    CONSTRAINT play_log_pk PRIMARY KEY (log_id),
    CONSTRAINT play_log_player_id_fk FOREIGN KEY (player_id)
        REFERENCES players (player_id) MATCH SIMPLE
        ON DELETE SET NULL,
    CONSTRAINT play_log_event_id_fk FOREIGN KEY (event_id)
        REFERENCES game_events (event_id) MATCH SIMPLE
        ON DELETE CASCADE
);

