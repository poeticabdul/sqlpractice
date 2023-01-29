/*
NASA astronauts data gotten from https://gist.github.com/pamelafox/b98e03caca7d1ec14394a90ec1512cff
Inspired by Khan Academy course on SQL > https://www.khanacademy.org/computing/computer-programming/sql/more-advanced-sql-queries/pp/project-data-dig
*/



/* === What are average, max, and min values in the data? === */


SELECT AVG(Space_Flights) FROM astronauts;
SELECT MAX(Space_Flights) FROM astronauts;
SELECT MAX(Space_Walks) FROM astronauts;
SELECT MIN(Year) FROM astronauts;


/* === What about those numbers per category in the data (using HAVING)? === */


/* Get the name, space flight, group number and military rank of astronauts grouped by military ranks who have a space flight of 5 or more */
SELECT Name, Space_Flights, GroupNum, Military_Rank FROM astronauts GROUP BY Military_Rank HAVING Space_Flights >= 5;


/* === What ways are there to group the data values that don’t exist yet (using CASE)? === */


/* Grouping astronauts by how many space flights and space walks they have had into starter, intermediate and expert */
SELECT Name, Military_Rank , 
    CASE 
        WHEN Space_Flights <=2 AND Space_Walks <=1 THEN "Starter"
        WHEN (Space_Flights > 2 AND Space_Flights <=5) AND (Space_Walks > 1 AND Space_Walks <=4) THEN "Intermediate"
        ELSE "Expert"
    END as "Recognition_Level"
FROM astronauts;


/* === What interesting ways are there to filter the data (using AND/OR)? === */


/* Get the name, space flight, group number and military rank of astronauts who have space flights of 5 mor more and have a military rank of Captain */
SELECT Name, Space_Flights, GroupNum, Military_Rank FROM astronauts WHERE Space_Flights >= 5 AND Military_Rank = "Captain";

/* Get the name, status, gender and militray rank of astronauts who have space flights of 5 or more and have a military rank of captain or have space walks of more than 5 */
SELECT Name, Status, Gender, Military_Rank FROM astronauts WHERE (Space_Flights >= 5 AND Military_Rank = "Captain") OR Space_Walks > 5;




