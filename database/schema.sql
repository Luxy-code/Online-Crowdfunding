-- CauseConnect schema (cloud-safe: no CREATE DATABASE / USE; run it on the DB your host gives you)

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS campaigns (
    campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    creator_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    goal_amount DECIMAL(10,2) NOT NULL,
    raised_amount DECIMAL(10,2) NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS contributions (
    contribution_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_id INT NOT NULL,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    contribution_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS campaign_updates (
    update_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_id INT,
    creator_id INT,
    title VARCHAR(200),
    message TEXT,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Demo data (password for all: 1234)
INSERT INTO users (name, email, password, role) VALUES
('Alice Creator', 'alice@test.com', '1234', 'CREATOR'),
('Bob Contributor', 'bob@test.com', '1234', 'CONTRIBUTOR'),
('Admin User', 'admin@test.com', '1234', 'ADMIN');

INSERT INTO campaigns (creator_id, title, description, goal_amount, status) VALUES
(1, 'Education for Poor Children', 'Fundraising to provide educational materials to children.', 50000.00, 'APPROVED');

INSERT INTO contributions (campaign_id, user_id, amount) VALUES (1, 2, 5000.00);
UPDATE campaigns SET raised_amount = 5000.00 WHERE campaign_id = 1;
