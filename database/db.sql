-- ProjectGroup 11 Step 6 - Portfolio Project, Genre Genie
-- Anthony Javiya
-- Thomas Magnus
-- This SQL file corresponds to the CS340 Portfolio Project Deliverables

SET FOREIGN_KEY_CHECKS=0;


-- TABLES
DROP TABLE IF EXISTS Customers, Rentals, Movies, Genres, Movie_Genre_Details; 

-- Create Customers Table
CREATE TABLE Customers (
    customer_id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    PRIMARY KEY (customer_id)
);

-- Create Movies Table
CREATE TABLE Movies (
    movie_id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    PRIMARY KEY (movie_id)
);

-- Create Rentals Table
CREATE TABLE Rentals (
    rental_id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    customer_id int(11),
    movie_id int(11) NOT NULL,
    due_date date NOT NULL,
    PRIMARY KEY (rental_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE
);

-- Create Genres Table
CREATE TABLE Genres (
    genre_id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    genre_name varchar(255) NOT NULL,
    PRIMARY KEY (genre_id)
);

-- Create Movie_Genre_Details Table (Intersection Table)
CREATE TABLE Movie_Genre_Details (
    movie_genre_id int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    movie_id int(11),
    genre_id int(11),
    PRIMARY KEY (movie_genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);


-- EXAMPLE DATA
-- Insert sample data into all tables
INSERT INTO Customers (first_name, last_name, email)
VALUES ('Chris', 'Cornell', 'spoonman@gmail.com'),
('Kurt', 'Cobain', 'teenspirit@gmail.com'),
('Scott', 'Weiland', 'bigempty@gmail.com');

INSERT INTO Movies (title)
VALUES ('Gladiator'),
('Jurassic Park'),
('Silence of the Lambs'),
('The Killing of a Sacred Deer'),
('Aliens');

INSERT INTO Genres (genre_name)
VALUES ('Action'),
('Sci-Fi/Fantasy'),
('Thriller');

INSERT INTO Rentals(customer_id, movie_id, due_date)
VALUES (1, 2, '2023-11-07'),
(1, 1, '2023-11-27'),
(2, 1, '2023-12-08'),
(3, 3, '2023-12-24'),
(3, 5, '2024-01-14');

INSERT INTO Movie_Genre_Details(movie_id, genre_id)
VALUES (1, 2),
(2,2),
(3, 3),
(4, 3),
(5, 1),
(5, 2);


SET FOREIGN_KEY_CHECKS=1;