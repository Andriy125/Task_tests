# SportWP Project


This repository contains SQL scripts for implementing a database for a sports web portal. 
The file "1. Development and implementation of a database for a sports web portal.docx" you will find the requirements for the project.



The project consists of three main SQL scripts:

1. **CreateDB.sql**: This script is responsible for creating the SportWP database and its tables.
2. **InitialData.sql**: This script populates the database with initial data for the Leagues, Teams, Articles, Games, Players, Events, Users, ArticleViews, Comments, Advertisement, and Media tables.
3. **CalculationKPI.sql**: This script calculates various Key Performance Indicators (KPIs) for the sports web portal based on the available data in the tables.

# Database Structure
The SportWP database consists of the following tables:

- **Leagues**: Stores data about sports leagues, including league ID and name.
- **Teams**: Contains information about sports teams, including team ID, name, and a relationship with leagues using a foreign key.
- **Articles**: Stores data about articles, including title, content, publication date, and relationships with teams using a foreign key.
- **Games**: Contains information about sports games, including game ID and date.
- **GameTeams**: A junction table that establishes a many-to-many relationship between games and teams.
- **Players**: Stores data about players, including player ID, name, and a relationship with teams using a foreign key.
- **Events**: Contains information about sports events such as goals, penalties, and red cards, including event ID, event type, description, and relationships with games and players using foreign keys.
- **Users**: Stores user data, including user ID, username, and email.
- **ArticleViews**: A junction table for storing article views by users.
- **Comments**: Stores user comments on articles, including comment ID, relationships with articles and users using foreign keys, and comment text.
- **Advertisement**: Contains information about advertisements, including advertisement ID, title, and content.
- **Media**: Stores data about media files (images and videos) associated with articles, teams, games, and advertisements.

# Database Constraints
The SportWP database has the following constraints in place:

- **Users**: The "username" and "email" fields are required and cannot have NULL values.
- **Leagues**: The "league_name" field has a unique constraint to prevent duplicate league names.
- **Users**: The "email" field also has a unique constraint to ensure the uniqueness of email addresses for each user.
- **Players**: The "team_id" field has a foreign key referencing the "team_id" field in the "Teams" table.
- **Events**: The "game_id" field has a foreign key referencing the "game_id" field in the "Games" table.
- **Articles**: The "CHK_publish_date" check ensures that the article's publication date is later than the current date.
- **ArticleViews**: The combined unique constraint "UC_article_user" ensures that each article can only be viewed once by a single user.

# Calculation of Key Performance Indicators (KPIs)
The code includes examples of calculating various Key Performance Indicators (KPIs) for the SportWP web portal. Here are some of them:

1. Select all records from the Leagues table
2. Select all teams from the Teams table that belong to the league with league_id = 1
3. Count the number of articles from the Articles table that belong to the team with team_id = 1
4. Select all games from the Games table that will take place after the current date
5. Select all players from the Players table that belong to the team with team_id = 2
6. Select all events from the Events table that are goals
7. Select all users from the Users table whose email ends with '@example.com'
8. Count the number of views of the article with article_id = 1 in the ArticleViews table
9. Select all comments on the article with article_id = 2 in the Comments table
10. Select all media files of type 'Image' in the Media table
