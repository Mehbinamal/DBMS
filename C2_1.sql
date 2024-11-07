CREATE DATABASE triggerQuestion;
CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Participant (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    event_id INT,
    gender CHAR(1),
    year INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Prizes (
    prize_id INT PRIMARY KEY AUTO_INCREMENT,
    `money` DECIMAL(10, 2),
    event_id INT,
    `rank` INT ,
    year INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Winners (
    prize_id INT,
    player_id INT,
    PRIMARY KEY (prize_id, player_id),
    FOREIGN KEY (prize_id) REFERENCES Prizes(prize_id),
    FOREIGN KEY (player_id) REFERENCES Participant(player_id)
);

DELIMITER //

CREATE TRIGGER after_event_insert
AFTER INSERT ON Event
FOR EACH ROW
BEGIN
    -- Insert 1st prize
    INSERT INTO Prizes (money, event_id, `rank`, year)
    VALUES (1500, NEW.event_id, 1, YEAR(CURDATE()));

    -- Insert 2nd prize
    INSERT INTO Prizes (money, event_id, `rank`, year)
    VALUES (1000, NEW.event_id, 2, YEAR(CURDATE()));

    -- Insert 3rd prize
    INSERT INTO Prizes (money, event_id, `rank`, year)
    VALUES (500, NEW.event_id, 3, YEAR(CURDATE()));
END //

DELIMITER ;

-- Insert events (this will also trigger the automatic prize creation)
INSERT INTO Event (event_id, name, description, city)
VALUES 
    (1, 'Tech Fest', 'Annual Technology Festival', 'Cochin'),
    (2, 'Sports Meet', 'Inter-college Sports Competition', 'Mumbai');

-- Insert participants linked to events
INSERT INTO Participant (player_id, name, event_id, gender, year)
VALUES 
    (1, 'Alice', 1, 'F', 2024),
    (2, 'Bob', 1, 'M', 2024),
    (3, 'Charlie', 2, 'M', 2024),
    (4, 'Diana', 2, 'F', 2024);

-- Insert winners by linking prizes with participants
INSERT INTO Winners (prize_id, player_id)
VALUES 
    (1, 1),  -- Alice won the 1st prize for event 1
    (2, 2),  -- Bob won the 2nd prize for event 1
    (4, 3),  -- Charlie won the 1st prize for event 2
    (5, 4);  -- Diana won the 2nd prize for event 2

-- Check Event table
SELECT * FROM Event;

-- Check Participant table
SELECT * FROM Participant;

-- Check Prizes table
SELECT * FROM Prizes;

-- Check Winners table
SELECT * FROM Winners;

mysql> -- Check Event table
mysql> SELECT * FROM Event;
+----------+-------------+----------------------------------+--------+
| event_id | name        | description                      | city   |
+----------+-------------+----------------------------------+--------+
|        1 | Tech Fest   | Annual Technology Festival       | Cochin |
|        2 | Sports Meet | Inter-college Sports Competition | Mumbai |
+----------+-------------+----------------------------------+--------+
2 rows in set (0.00 sec)

mysql> 
mysql> -- Check Participant table
mysql> SELECT * FROM Participant;
+-----------+---------+----------+--------+------+
| player_id | name    | event_id | gender | year |
+-----------+---------+----------+--------+------+
|         1 | Alice   |        1 | F      | 2024 |
|         2 | Bob     |        1 | M      | 2024 |
|         3 | Charlie |        2 | M      | 2024 |
|         4 | Diana   |        2 | F      | 2024 |
+-----------+---------+----------+--------+------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- Check Prizes table
mysql> SELECT * FROM Prizes;
+----------+---------+----------+------+------+
| prize_id | money   | event_id | rank | year |
+----------+---------+----------+------+------+
|        1 | 1500.00 |        1 |    1 | 2024 |
|        2 | 1000.00 |        1 |    2 | 2024 |
|        3 |  500.00 |        1 |    3 | 2024 |
|        4 | 1500.00 |        2 |    1 | 2024 |
|        5 | 1000.00 |        2 |    2 | 2024 |
|        6 |  500.00 |        2 |    3 | 2024 |
+----------+---------+----------+------+------+
6 rows in set (0.00 sec)

mysql> 
mysql> -- Check Winners table
mysql> SELECT * FROM Winners;
+----------+-----------+
| prize_id | player_id |
+----------+-----------+
|        1 |         1 |
|        2 |         2 |
|        4 |         3 |
|        5 |         4 |
+----------+-----------+
