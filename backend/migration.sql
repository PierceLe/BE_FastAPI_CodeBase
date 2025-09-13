-- FastAPI Boilerplate Database Migration
-- Creates user table with authentication support

CREATE DATABASE IF NOT EXISTS fastapi_boilerplate;
USE fastapi_boilerplate;

-- User table for authentication and user management
CREATE TABLE IF NOT EXISTS user (
    user_id VARCHAR(36) PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(500),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    avatar_url VARCHAR(500),
    is_verified BOOLEAN DEFAULT FALSE,
    use_2fa_login BOOLEAN DEFAULT FALSE,
    two_factor_secret VARCHAR(255),
    method ENUM('normal', 'google') NOT NULL,
    salt VARCHAR(500),
    pin TEXT,
    public_key TEXT,
    encrypted_private_key TEXT,
    biography VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_user_id (user_id)
);
