-- Drop table
DROP TABLE IF EXISTS users;

-- Create table (MATCHES FLASK MODEL)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,

  -- Auth
  email VARCHAR(150) UNIQUE NOT NULL,
  phone_number VARCHAR(20),

  password VARCHAR(105) NOT NULL,

  -- Profile
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25),

  bio VARCHAR(1000),

  birthdate DATE NOT NULL,

  gender VARCHAR(50),
  interested_in VARCHAR(50),

  height_cm INTEGER,
  location VARCHAR(100),

  -- Account Status
  is_active BOOLEAN DEFAULT TRUE,
  is_verified BOOLEAN DEFAULT FALSE,

  -- Timestamp
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO users (
  first_name,
  last_name,
  email,
  password,
  birthdate,
  created_at
)
VALUES
  ('User1', 'Sample', 'user1@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User2', 'Sample', 'user2@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User3', 'Sample', 'user3@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User4', 'Sample', 'user4@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User5', 'Sample', 'user5@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User6', 'Sample', 'user6@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User7', 'Sample', 'user7@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User8', 'Sample', 'user8@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('User9', 'Sample', 'user9@example.com', 'hashed_pass', '2000-01-01', NOW()),
  ('Dan', 'Gavin', 'dan.gavin49@gmail.com', 'hashed_pass', '2000-01-01', NOW());