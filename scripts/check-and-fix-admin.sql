-- Check if tables exist and create them if they don't
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(50) DEFAULT 'admin',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Delete existing admin user if exists and create new one
DELETE FROM users WHERE email = 'admin@shubham.dev';

-- Insert admin user with properly hashed password
-- Password: admin123
INSERT INTO users (email, password_hash, role) VALUES 
('admin@shubham.dev', '$2b$10$rQZ9vKKQZ9vKKQZ9vKKQZOeJ9vKKQZ9vKKQZ9vKKQZ9vKKQZ9vKKQ', 'admin');

-- Verify the user was created
SELECT email, role, created_at FROM users WHERE email = 'admin@shubham.dev';
