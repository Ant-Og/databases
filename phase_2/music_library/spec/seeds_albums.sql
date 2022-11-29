TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY; 

INSERT INTO artists (name, genre) VALUES ('Kendrick Lamar', 'Rap');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Section.80', '2010', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Good Kid, M.A.A.D City', '2012', '1');