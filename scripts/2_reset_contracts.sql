-- Drop table
DROP TABLE IF EXISTS contracts;

-- Create table
CREATE TABLE contracts (
  id SERIAL PRIMARY KEY,

  -- Owner
  user_id INTEGER NOT NULL REFERENCES users(id),

  -- Contract Information
  name VARCHAR(255) NOT NULL,

  -- S3
  s3_key VARCHAR(500) NOT NULL,

  -- Timestamp
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert a sample contract for testing
INSERT INTO contracts (
  user_id,
  name,
  s3_key,
  created_at
)
VALUES
  (
    1,
    'Sample Service Agreement',
    'contracts/1/sample-service-agreement.pdf',
    NOW()
  );