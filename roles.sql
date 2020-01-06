--
-- Set up the users for SYSL
--

-- Create the main sysl role
-- CREATE USER sysl WITH PASSWORD '<ENTER CORRECT PASSWORD HERE>';

-- Grant all necessary access
GRANT USAGE ON SCHEMA public TO sysl;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO sysl;
ALTER DEFAULT PRIVILEGES FOR ROLE sysl IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO sysl;
GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA public TO sysl;
ALTER DEFAULT PRIVILEGES FOR ROLE sysl IN SCHEMA public GRANT SELECT, USAGE ON SEQUENCES TO sysl;

