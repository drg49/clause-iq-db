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

-- Insert statements with every column explicitly filled
INSERT INTO users (
  email,
  phone_number,
  password,
  first_name,
  last_name,
  bio,
  birthdate,
  gender,
  interested_in,
  height_cm,
  location,
  is_active,
  is_verified,
  created_at
)
VALUES
  (
    'user1@example.com', 
    '+15551234567', 
    'hashed_pass_1', 
    'Alex', 
    'Mercer', 
    'Love hiking, tech, and trying new coffee spots around town.', 
    '1995-04-12', 
    'Male', 
    'Female', 
    182, 
    'Los Angeles, CA', 
    TRUE, 
    TRUE, 
    NOW()
  ),
  (
    'user2@example.com', 
    '+15559876543', 
    'hashed_pass_2', 
    'Jordan', 
    'Blake', 
    'Amateur chef and avid reader. Looking for someone to explore food festivals with.', 
    '1998-11-23', 
    'Female', 
    'Male', 
    167, 
    'Austin, TX', 
    TRUE, 
    FALSE, 
    NOW()
  ),
  (
    'user3@example.com', 
    '+15554448888', 
    'hashed_pass_3', 
    'Taylor', 
    'Swiftly', 
    'Weekend musician, dog lover, and full-time software developer.', 
    '2001-08-05', 
    'Female', 
    'Male', 
    175, 
    'New York, NY', 
    TRUE, 
    TRUE, 
    NOW()
  );