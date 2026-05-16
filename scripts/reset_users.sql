-- Drop the existing "users" table if it exists:
DROP TABLE IF EXISTS users;

-- Recreate the "users" table:
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  username VARCHAR(25) UNIQUE NOT NULL,
  password VARCHAR(105) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert 10 sample users with a hashed password of "pass":
INSERT INTO users (first_name, last_name, email, username, password, created_at)
VALUES
  ('User1', 'Sample', 'user1@example.com', 'user1', SHA256('pass'), NOW()),
  ('User2', 'Sample', 'user2@example.com', 'user2', SHA256('pass'), NOW()),
  ('User3', 'Sample', 'user3@example.com', 'user3', SHA256('pass'), NOW()),
  ('User4', 'Sample', 'user4@example.com', 'user4', SHA256('pass'), NOW()),
  ('User5', 'Sample', 'user5@example.com', 'user5', SHA256('pass'), NOW()),
  ('User6', 'Sample', 'user6@example.com', 'user6', SHA256('pass'), NOW()),
  ('User7', 'Sample', 'user7@example.com', 'user7', SHA256('pass'), NOW()),
  ('User8', 'Sample', 'user8@example.com', 'user8', SHA256('pass'), NOW()),
  ('User9', 'Sample', 'user9@example.com', 'user9', SHA256('pass'), NOW()),
  ('Dan', 'Gavin', 'dan.gavin49@gmail.com', 'dan500', SHA256('pass'), NOW());
