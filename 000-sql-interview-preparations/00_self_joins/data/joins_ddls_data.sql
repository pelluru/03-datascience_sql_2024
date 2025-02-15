-- Data for following article on joins  
-- https://www.stratascratch.com/blog/sql-join-interview-questions/
-- make sure to run self joins ddl sql first 

-- Create table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    joined_at DATE NOT NULL,
    city_id INT NOT NULL,
    device INT NOT NULL
);

-- Insert data
INSERT INTO users (id, name, joined_at, city_id, device) VALUES
(4, 'Ashley Sparks', '2020-06-30', 63, 2185),
(8, 'Zachary Tucker', '2018-02-18', 78, 3900),
(9, 'Caitlin Carpenter', '2020-07-23', 60, 8592),
(18, 'Wanda Ramirez', '2018-09-28', 55, 7904),
(21, 'Tonya Johnson', '2019-12-02', 62, 4816),
(24, 'Carlos Newman', '2020-02-06', 74, 861),
(25, 'Natasha Bradford', '2020-02-12', 60, 9401),
(27, 'Jessica Farrell', '2019-03-24', 67, 7190),
(32, 'Catherine Hurst', '2018-08-22', 51, 5529),
(33, 'Amanda Leon', '2017-10-06', 77, 4597),
(34, 'Donald Ross', '2017-10-14', 54, 1239),
(37, 'Michael Turner', '2018-04-01', 74, 1041),
(41, 'Donna Walker', '2017-10-05', 70, 1586),
(46, 'Tracy Hunter', '2019-08-10', 51, 2936),
(50, 'Samuel Miller', '2020-07-24', 50, 666),
(52, 'Michelle Jimenez', '2019-02-19', 66, 7393),
(56, 'Theresa Weaver', '2019-11-05', 72, 8209),
(58, 'Rhonda Davis', '2018-08-25', 79, 3822),
(78, 'Zachary Anderson', '2019-02-15', 71, 5696),
(82, 'Jacob York', '2020-08-21', 75, 540),
(87, 'David Taylor', '2019-05-11', 75, 7120),
(89, 'Kyle Curry', '2018-05-18', 56, 2054),
(95, 'Robert Little', '2020-07-27', 54, 383),
(99, 'Ryan Howe', '2018-08-18', 52, 9036);
