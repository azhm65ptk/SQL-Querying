-- Comments in SQL Start with dash-dash --


-- 1. Find the entire record for the app with an ID of `1880`.
SELECT * FROM analytics WHERE id=1880;
  id  |        app_name         |   category   | rating | reviews |        size        | min_installs | price | content_rating |     genres     | last_updated | current_version |  android_version   
------+-------------------------+--------------+--------+---------+--------------------+--------------+-------+----------------+----------------+--------------+-----------------+--------------------
 1880 | Web Browser for Android | PRODUCTIVITY |    4.3 |  144879 | Varies with device |     10000000 |     0 | Everyone       | {Productivity} | 2016-01-24   | 3.5.0           | Varies with device
(1 row)


-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics WHERE last_updated='2018-08-01';
  id  |                                     app_name                                      
------+-----------------------------------------------------------------------------------
   10 | Clash Royale
   11 | Candy Crush Saga
   12 | UC Browser - Fast Download Private & Secure
   74 | Score! Hero
  101 | Tiny Flashlight + LED
  102 | Crossy Road
  103 | SimCity BuildIt
  111 | FIFA Soccer
  112 | Angry Birds 2
  125 | Need for Speed™ No Limits
  126 | YouCam Makeup - Magic Selfie Makeovers
  152 | Fallout Shelter
  159 | DU Recorder – Screen Recorder, Video Editor, Live
  160 | Bike Race Free - Top Motorcycle Racing Games
  161 | KakaoTalk: Free Calls & Text
  162 | Dolphin Browser - Fast, Private & Adblock🐬
  163 | Opera Browser: Fast and Secure
  164 | MARVEL Contest of Champions
  184 | Video Editor Music,Cut,No Crop
  226 | Frozen Free Fall
  260 | Chess Free
  276 | ► MultiCraft ― Free Miner! 👍
  277 | Vlogger Go Viral - Tuber Game
  300 | Bad Piggies
  301 | Skater Boy
  356 | S Photo Editor - Collage Maker , Photo Collage
  357 | Magisto Video Editor & Maker
  358 | Itau bank
  359 | DEER HUNTER 2018
  360 | Mobizen Screen Recorder for SAMSUNG
  362 | Bike Racing 3D
playstore=# 


-- 3. Count the number of apps in each category, e.g. "Family | 1972".
SELECT category, COUNT(*)  
 FROM analytics
GROUP BY category;


-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT * FROM analytics 
ORDER BY reviews DESC 
Limit 5;


-- 5. Find the full record of the app that has the most reviews 
--     with a rating greater than equal to 4.8.
SELECT * 
FROM analytics 
WHERE rating>=4.8 
ORDER BY reviews DESC  
LIMIT 1;


-- 6. Find the average rating for each category ordered 
--      by the highest rated to lowest rated.
SELECT category, AVG(rating) 
FROM analytics 
GROUP BY category 
ORDER BY AVG(rating) DESC;

-- 7. Find the name, price, and rating of the most 
--     expensive app with a rating that's less than 3
SELECT app_name,price,rating FROM analytics 
WHERE rating <3 
ORDER BY price DESC 
LIMIT 1;                                                                                                                       WHERE rating <3                                                                                                                                                              ORDER BY price DESC                                                                                                                                                          LIMIT 1;
      app_name      | price  | rating 
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)


-- 8. Find all records with a min install not exceeding 50, that have a rating. 
--      Order your results by highest rated first.
SELECT * FROM analytics
WHERE min_installs <=50 AND rating IS NOT NULL
ORDER BY rating DESC;


-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name 
FROM analytics
WHERE rating <3 AND reviews >=10000;


-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics
WHERE price BETWEEN 0.1 and 1 
ORDER BY reviews DESC 
LIMIT 10;

-- 11. Find the most out of date app. 
--  Hint: You don't need to do it this way, but it's possible to do with a subquery:
--  http://www.postgresqltutorial.com/postgresql-max-function/
SELECT * 
FROM analytics
 ORDER BY last_updated
LIMIT 1;

-- 12. Find the most expensive app (the query is very similar to #11).
SELECT * 
FROM analytics
 ORDER BY price DESC
LIMIT 1;

-- 13. Count all the reviews in the Google Play Store.
SELECT SUM(reviews) AS "Total-review" from analytics;
 Total-review 
--------------
   4814575866
(1 row)


-- 14. Find all the categories that have more than 300 apps in them.
# SELECT category FROM analytics
 GROUP BY category
HAVING count(*) > 300;
    category     
-----------------
 COMMUNICATION
 PHOTOGRAPHY
 GAME
 BUSINESS
 MEDICAL
 TOOLS
 LIFESTYLE
 PRODUCTIVITY
 PERSONALIZATION
 FINANCE
 SPORTS
 FAMILY
(12 rows)


-- 15. Find the app that has the highest proportion of reviews to min_installs,
-- among apps that have been installed at least 100,000 times. Display the name of the app
-- along with the number of reviews, the min_installs, and the proportion.
# SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion 
FROM analytics 
WHERE min_installs>=100000
ORDER BY proportion DESC                                                                                                                                                     LIMIT 1;
     app_name     | reviews | min_installs | proportion 
------------------+---------+--------------+------------
 Kim Bu Youtuber? |      66 |     10000000 |     151515
(1 row)
