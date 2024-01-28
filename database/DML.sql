-- These are the Database Manipulation queries for managing the Movies Rental database.
-- These queries implement functionalities for managing movies, customers, rentals, genres, and movie-genre associations.

-- Get all Movie IDs and Titles to populate a Movies dropdown
SELECT movie_id, title FROM Movies;

-- Get all Customer IDs and Names to populate a Customers dropdown
SELECT customer_id, customer_name FROM Customers;

-- Get all Genre IDs and Names to populate a Genres dropdown
SELECT genre_id, genre_name FROM Genres;

-- Get a single Customer's details for updating their information
SELECT customer_id, customer_name, email FROM Customers WHERE customer_id = :customer_id_input;

-- Get all Rental Records with Movie Titles and Customer Names for the Rentals List page
SELECT Rentals.rental_id, Customers.customer_name, Movies.title, Rentals.due_date
FROM Rentals
INNER JOIN Customers ON Rentals.customer_id = Customers.customer_id
INNER JOIN Movies ON Rentals.movie_id = Movies.movie_id;

-- Add a new Movie record
INSERT INTO Movies (title) VALUES (:titleInput);

-- Add a new Customer record
INSERT INTO Customers (customer_name, email) VALUES (:customerNameInput, :emailInput);

-- Create a new Rental transaction
INSERT INTO Rentals (customer_id, movie_id, due_date) VALUES (:customer_id_from_dropdown, :movie_id_from_dropdown, :due_dateInput);

-- Add a new Genre record
INSERT INTO Genres (genre_name) VALUES (:genreNameInput);

-- Associate a Movie with a Genre (Many-to-Many relationship addition)
INSERT INTO Movie_Genre_Details (movie_id, genre_id) VALUES (:movie_id_from_dropdown, :genre_id_from_dropdown);

-- Update a Customer's details based on submission from the Update Customer form
UPDATE Customers SET customer_name = :customerNameInput, email = :emailInput WHERE customer_id = :customer_id_input;

-- Delete a Movie record
DELETE FROM Movies WHERE movie_id = :movie_id_input;

-- Delete a Customer record
DELETE FROM Customers WHERE customer_id = :customer_id_input;

-- Disassociate a Movie from a Genre (Many-to-Many relationship deletion)
DELETE FROM Movie_Genre_Details WHERE movie_id = :movie_id_input AND genre_id = :genre_id_input;

-- Delete a Rental record
DELETE FROM Rentals WHERE rental_id = :rental_id_input;