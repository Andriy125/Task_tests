-- Calculation of KPIs for the sports web portal

USE SportWP;

-- 1. Select all records from the Leagues table
SELECT * FROM Leagues;

-- 2. Select all teams from the Teams table that belong to the league with league_id = 1
SELECT * FROM Teams WHERE league_id = 1;

-- 3. Count the number of articles from the Articles table that belong to the team with team_id = 1
SELECT COUNT(*) FROM Articles WHERE team_id = 1;

-- 4. Select all games from the Games table that will take place after the current date
SELECT * FROM Games WHERE game_date > GETDATE();

-- 5. Select all players from the Players table that belong to the team with team_id = 2
SELECT * FROM Players WHERE team_id = 2;

-- 6. Select all events from the Events table that are goals
SELECT * FROM Events WHERE event_type = 'Goal';

-- 7. Select all users from the Users table whose email ends with '@example.com'
SELECT * FROM Users WHERE email LIKE '%@example.com';

-- 8. Count the number of views of the article with article_id = 1 in the ArticleViews table
SELECT COUNT(*) FROM ArticleViews WHERE article_id = 1;

-- 9. Select all comments on the article with article_id = 2 in the Comments table
SELECT * FROM Comments WHERE article_id = 2;

-- 10. Select all media files of type 'Image' in the Media table
SELECT * FROM Media WHERE media_type = 'Image';
