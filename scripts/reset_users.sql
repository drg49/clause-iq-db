-- Drop table
DROP TABLE IF EXISTS users;

-- Create table (MATCHES FLASK MODEL)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,

  -- Auth
  email VARCHAR(150) UNIQUE NOT NULL,
  username VARCHAR(25) NOT NULL,
  phone_number VARCHAR(20),

  -- Password hashes (scrypt/bcrypt hashes can exceed 105 chars)
  password VARCHAR(255) NOT NULL,

  -- Profile
  bio VARCHAR(1000),

  location VARCHAR(100),

  -- Account Status
  is_active BOOLEAN DEFAULT TRUE,

  -- Timestamp
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert a sample user for testing
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
    'Taylor_Swiftly', 
    '+15554448888', 
    'hashed_pass_3', 
    'Weekend musician, dog lover, and full-time software developer.', 
    'New York, NY', 
    TRUE, 
    NOW()
  );