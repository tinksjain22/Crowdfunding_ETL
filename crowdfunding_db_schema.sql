
-- Create the crowdfunding_db database
CREATE DATABASE crowdfunding_db;

-- Connect to the crowdfunding_db database
\c crowdfunding_db;

-- Table for categories
CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,
    category VARCHAR(255) NOT NULL
);

-- Table for subcategories
CREATE TABLE subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY,
    subcategory VARCHAR(255) NOT NULL
);

-- Table for contacts
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) UNIQUE
);

-- Table for campaigns
CREATE TABLE campaign (
    cf_id INT PRIMARY KEY,
    contact_id INT REFERENCES contacts(contact_id) ON DELETE CASCADE,
    company_name VARCHAR(255),
    description TEXT,
    goal DECIMAL(12, 2) CHECK (goal >= 0),
    pledged DECIMAL(12, 2) CHECK (pledged >= 0),
    outcome VARCHAR(50),
    backers_count INT CHECK (backers_count >= 0),
    country CHAR(2),
    currency VARCHAR(3),
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR(10) REFERENCES category(category_id),
    subcategory_id VARCHAR(10) REFERENCES subcategory(subcategory_id)
);

-- Viewing the tables 
SELECT * FROM Campaign;
SELECT * FROM Category;	
SELECT * FROM Subcategory;
SELECT * FROM Contacts;

