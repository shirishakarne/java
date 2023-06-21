use shirisha;
CREATE TABLE user4(
  user_id INT PRIMARY KEY,
  email_domain VARCHAR(255),
  country VARCHAR(255),
  postal VARCHAR(255),
  mobile_app VARCHAR(255),
  sign_up_at TIMESTAMP
);
select * from user4;

CREATE TABLE progress1 (
  user_id INT PRIMARY KEY,
  learn_cpp INT,
  learn_sql INT,
  learn_html INT,
  learn_javascript INT,
  learn_java INT,
  foreign key (user_id) references user4(user_id)
);
-- Insert records into the users table
INSERT INTO user4 (user_id, email_domain, country, postal, mobile_app, sign_up_at)
VALUES
  -- Insert records into the users table
  (1, 'monster@gmail.com', 'USA', '56478', 'mobile-user', '2023-06-01 10:00:00'),
(2, 'sprite@example.com', 'Canada', '66778', 'mobile-user', '2023-06-02 11:00:00'),
  (3, 'Coco cola@example.com', 'UK', '66567', NULL, '2023-06-03 12:00:00'),
  (4, 'Thumsup@example.com', 'Canada', '67340', 'mobile-user', '2023-06-02 11:00:00'),
 ( 5, 'Mango@example.com', 'Canada', '67560', 'mobile-user', '2023-06-02 11:00:00');

-- Insert records into the progress table
INSERT INTO progress1 (user_id, learn_cpp, learn_sql, learn_html, learn_javascript, learn_java)
VALUES
  (1, 1, 0, 1, 0, 1),
  (2, 1, 1, 1, 1, 0),
  (3, 0, 1, 1, 0, 0),
  (4, 0, 1, 1, 0, 0),
  (5, 0, 1, 1, 0, 0);
 select * from progress1;
 SELECT email_domain, COUNT(*) AS learner_count
FROM user4
WHERE email_domain LIKE '%.edu'
GROUP BY email_domain
ORDER BY learner_count DESC
LIMIT 25;
SELECT COUNT(*) AS ny_edu_learners
FROM user4
WHERE email_domain LIKE '%.edu' AND country = 'New York';
SELECT COUNT(*) AS mobile_app_users
FROM user4
WHERE mobile_app = 'mobile-user';

SELECT DATE_FORMAT(sign_up_at, '%Y-%m-%d %H:00:00') AS signup_hour,
       COUNT(*) AS signup_count
FROM user4
GROUP BY signup_hour
ORDER BY signup_hour;
-- Different schools (.edu domains) and their preferred courses
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM user4 u
JOIN progress p ON u.user_id = p.user_id
WHERE u.email_domain LIKE '%.edu'
GROUP BY u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java;

-- Courses taken by New York students
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM user4 u
JOIN progress p ON u.user_id = p.user_id
WHERE u.country = 'New York';

-- Courses taken by Chicago students
SELECT u.email_domain, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM user4 u
JOIN progress p ON u.user_id = p.user_id
WHERE u.country ='chicago';