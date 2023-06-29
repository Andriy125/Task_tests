-- Create the SportWP database 

CREATE DATABASE SportWP;



-- Use the SportWP database
USE SportWP;

-- Create the Leagues table
CREATE TABLE Leagues (
    league_id INT PRIMARY KEY,
    league_name NVARCHAR(255) NOT NULL
);

-- Create the Teams table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name NVARCHAR(255) NOT NULL,
    league_id INT,
    FOREIGN KEY (league_id) REFERENCES Leagues (league_id)
);

-- Create the Articles table
CREATE TABLE Articles (
    article_id INT PRIMARY KEY,
    title NVARCHAR(MAX) NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    publish_date DATETIME NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams (team_id)
);

-- Create the Games table
CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    game_date DATETIME NOT NULL
);

-- Create the GameTeams table
CREATE TABLE GameTeams (
    game_id INT,
    team_id INT,
    FOREIGN KEY (game_id) REFERENCES Games (game_id),
    FOREIGN KEY (team_id) REFERENCES Teams (team_id)
);

-- Create the Players table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name NVARCHAR(255) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams (team_id)
);

-- Create the Events table
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_type NVARCHAR(255) NOT NULL,
    event_description NVARCHAR(MAX) NOT NULL,
    game_id INT,
    player_id INT,
    FOREIGN KEY (game_id) REFERENCES Games (game_id),
    FOREIGN KEY (player_id) REFERENCES Players (player_id)
);

-- Create the Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL
);

-- Create the ArticleViews table
CREATE TABLE ArticleViews (
    view_id INT PRIMARY KEY,
    article_id INT,
    user_id INT,
    FOREIGN KEY (article_id) REFERENCES Articles (article_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

-- Create the Comments table
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    article_id INT,
    user_id INT,
    comment_text NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (article_id) REFERENCES Articles (article_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

-- Create the Advertisement table
CREATE TABLE Advertisement (
    ad_id INT PRIMARY KEY,
    ad_title NVARCHAR(255) NOT NULL,
    ad_content NVARCHAR(MAX) NOT NULL
);

-- Create the Media table
CREATE TABLE Media (
    media_id INT PRIMARY KEY,
    media_type NVARCHAR(255) NOT NULL,
    file_path NVARCHAR(MAX) NOT NULL,
    article_id INT,
    team_id INT,
    game_id INT,
    ad_id INT,
    FOREIGN KEY (article_id) REFERENCES Articles (article_id),
    FOREIGN KEY (team_id) REFERENCES Teams (team_id),
    FOREIGN KEY (game_id) REFERENCES Games (game_id),
    FOREIGN KEY (ad_id) REFERENCES Advertisement (ad_id)
);


-- Add constraints and restrictions to the tables

-- Make the username column in the Users table not nullable
ALTER TABLE Users
ALTER COLUMN username NVARCHAR(255) NOT NULL;

-- Make the email column in the Users table not nullable
ALTER TABLE Users
ALTER COLUMN email NVARCHAR(255) NOT NULL;

-- Add a unique constraint on the league_name column in the Leagues table
ALTER TABLE Leagues
ADD CONSTRAINT UC_league_name UNIQUE (league_name);

-- Add a unique constraint on the email column in the Users table
ALTER TABLE Users
ADD CONSTRAINT UC_email UNIQUE (email);

-- Add a foreign key constraint on the team_id column in the Players table
ALTER TABLE Players
ADD CONSTRAINT FK_players_team_id FOREIGN KEY (team_id) REFERENCES Teams (team_id);

-- Add a foreign key constraint on the game_id column in the Events table
ALTER TABLE Events
ADD CONSTRAINT FK_events_game_id FOREIGN KEY (game_id) REFERENCES Games (game_id);

-- Add a check constraint to ensure publish_date is always greater than the current date in the Articles table
ALTER TABLE Articles
ADD CONSTRAINT CHK_publish_date CHECK (publish_date > GETDATE());

-- Add a unique constraint on the combination of article_id and user_id columns in the ArticleViews table
ALTER TABLE ArticleViews
ADD CONSTRAINT UC_article_user UNIQUE (article_id, user_id);
