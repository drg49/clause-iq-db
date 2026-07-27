-- Drop table
DROP TABLE IF EXISTS users;

-- Create table (MATCHES FLASK MODEL)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,

  -- Auth
  email VARCHAR(150) UNIQUE NOT NULL,
  username VARCHAR(25) NOT NULL,
  phone_number VARCHAR(20),

  password VARCHAR(105) NOT NULL,

  -- Profile
  bio VARCHAR(1000),

  location VARCHAR(100),

  -- Account Status
  is_active BOOLEAN DEFAULT TRUE,

  -- Timestamp
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert statements with every column explicitly filled
INSERT INTO users (
  email,
  username,
  phone_number,
  password,
  bio,
  location,
  is_active,
  created_at
)
VALUES
  (
    'user1@example.com', 
    'Alex_Mercer', 
    '+15551234567', 
    'hashed_pass_1', 
    'Love hiking, tech, and trying new coffee spots around town.', 
    'Los Angeles, CA', 
    TRUE, 
    NOW()
  ),
  (
    'user2@example.com', 
    'Jordan_Blake', 
    '+15559876543', 
    'hashed_pass_2', 
    'Amateur chef and avid reader. Looking for someone to explore food festivals with.', 
    'Austin, TX', 
    TRUE, 
    NOW()
  ),
  (
    'user3@example.com', 
    'Taylor_Swiftly', 
    '+15554448888', 
    'hashed_pass_3', 
    'Weekend musician, dog lover, and full-time software developer.', 
    'New York, NY', 
    TRUE, 
    NOW()
  );