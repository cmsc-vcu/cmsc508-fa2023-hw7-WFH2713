# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people_roles;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255),
    time_commitment INT,
    PRIMARY KEY (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag) VALUES
(1, 'Hockey', 'skatting', 'Skill 1'),
(2, 'Basketball', 'dribbling', 'Skill 2'),
(3, 'Baseball', 'swingging', 'Skill 3'),
(4, 'Football', 'throwing', 'Skill 4'),
(5, 'Soccer', 'kicking', 'Skill 5'),
(6, 'Tennis', 'hitting', 'Skill 6'),
(7, 'Cornhole', 'tossing', 'Skill 7'),
(8, 'Track', 'running', 'Skill 8');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'https://www.linkedin.com/in/johndoe', 'http://headshot.url/johndoe', 'john_doe', 'Experienced software developer.', '2023-01-10'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', 'https://www.linkedin.com/in/janesmith', NULL, 'jane_smith', 'Marketing expert with a knack for social media.', '2023-01-15'),
(3, 'Emily', 'Jones', NULL, NULL, 'http://headshot.url/emilyjones', NULL, 'Project manager with a decade of experience.', '2023-02-01'),
(4, 'Michael', 'Brown', NULL, 'https://www.linkedin.com/in/michaelbrown', NULL, 'mike_brown', NULL, '2023-02-20'),
(5, 'David', 'Wilson', 'david.wilson@email.com', NULL, NULL, 'david_wilson', 'Graphic designer specializing in web design.', '2023-03-05'),
(6, 'Sarah', 'Johnson', NULL, NULL, NULL, NULL, 'HR specialist focused on tech industries.', '2023-03-10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.


INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-01-01'),
(3, 1, '2023-04-19'),
(6, 1, '2023-10-24'),
(3, 2, '2023-05-01'),
(4, 2, '2023-09-27'),
(5, 2, '2023-12-03'),
(1, 3, '2023-02-14'),
(5, 3, '2023-07-02'),
(3, 5, '2023-04-27'),
(6, 5, '2023-10-02'),
(2, 6, '2023-03-18'),
(3, 6, '2023-06-02'),
(4, 6, '2023-10-21'),
(3, 7, '2023-05-01'),
(5, 7, '2023-10-02'),
(6, 7, '2023-10-03'),
(1, 8, '2023-01-01'),
(3, 8, '2023-04-29'),
(5, 8, '2023-09-03'),
(6, 8, '2023-11-04'),
(2, 9, '2023-03-01'),
(5, 9, '2023-08-02'),
(6, 9, '2023-12-03'),
(1, 10, '2023-02-01'),
(4, 10, '2023-06-12'),
(5, 10, '2023-11-03');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT NOT NULL,
    name VARCHAR(255),
    sort_priority INT,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE people_roles (
    id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO people_roles (people_id, role_id, date_assigned) VALUES
(1, 2, '2023-01-01'),
(2, 5, '2023-01-01'),
(2, 6, '2023-01-01'),
(3, 2, '2023-01-01'),
(3, 4, '2023-01-01'),
(4, 3, '2023-01-01'),
(5, 3, '2023-01-01'),
(6, 2, '2023-01-01'),
(6, 1, '2023-01-01');