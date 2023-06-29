USE SportWP;

-- Insert initial data into the Leagues table
INSERT INTO Leagues (league_id, league_name)
VALUES
    (1, 'Premier League'),
    (2, 'La Liga'),
    (3, 'Serie A');

-- Insert initial data into the Teams table
INSERT INTO Teams (team_id, team_name, league_id)
VALUES
    (1, 'Manchester United', 1),
    (2, 'Real Madrid', 2),
    (3, 'Juventus', 3);

-- Insert initial data into the Articles table
INSERT INTO Articles (article_id, title, content, publish_date, team_id)
VALUES
    (1, 'Title 1', 'Content 1', GETDATE(), 1),
    (2, 'Title 2', 'Content 2', GETDATE(), 2),
    (3, 'Title 3', 'Content 3', GETDATE(), 3);

-- Insert initial data into the Games table
INSERT INTO Games (game_id, game_date)
VALUES
    (1, GETDATE()),
    (2, GETDATE()),
    (3, GETDATE());

-- Insert initial data into the Players table
INSERT INTO Players (player_id, player_name, team_id)
VALUES
    (1, 'Player 1', 1),
    (2, 'Player 2', 2),
    (3, 'Player 3', 3);

-- Insert initial data into the Events table
INSERT INTO Events (event_id, event_type, event_description, game_id, player_id)
VALUES
    (1, 'Goal', 'Goal description', 1, 1),
    (2, 'Penalty', 'Penalty description', 2, 2),
    (3, 'Red Card', 'Red Card description', 3, 3);

-- Insert initial data into the Users table
INSERT INTO Users (user_id, username, email)
VALUES
    (1, 'User 1', 'user1@example.com'),
    (2, 'User 2', 'user2@example.com'),
    (3, 'User 3', 'user3@example.com');

-- Insert initial data into the ArticleViews table
INSERT INTO ArticleViews (view_id, article_id, user_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

-- Insert initial data into the Comments table
INSERT INTO Comments (comment_id, article_id, user_id, comment_text)
VALUES
    (1, 1, 1, 'Comment 1'),
    (2, 2, 2, 'Comment 2'),
    (3, 3, 3, 'Comment 3');

-- Insert initial data into the Advertisement table
INSERT INTO Advertisement (ad_id, ad_title, ad_content)
VALUES
    (1, 'Ad Title 1', 'Ad Content 1'),
    (2, 'Ad Title 2', 'Ad Content 2'),
    (3, 'Ad Title 3', 'Ad Content 3');

-- Insert initial data into the Media table
INSERT INTO Media (media_id, media_type, file_path, article_id, team_id, game_id, ad_id)
VALUES
    (1, 'Image', 'image1.jpg', 1, NULL, NULL, NULL),
    (2, 'Image', 'image2.jpg', NULL, 2, NULL, NULL),
    (3, 'Video', 'video1.mp4', NULL, NULL, 3, NULL);