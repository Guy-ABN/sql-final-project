/*
 * Author: Guy Abou Nader
 * ID: 20200028
 * Email: guy.nader.std@aku.edu.lb
 * Course: Advanced Database (SQL)
 * Professor: Dr. Ahmad Ahmad Kassem
 */

/*
 * Create the database
 */
CREATE DATABASE IF NOT EXISTS `sql_final_project`;
USE `sql_final_project`;

/*
 * 1. Write SQL statements to create the above relations without specifying the primary and
 * foreign keys. Choose the appropriate type for each attribute.
 */
CREATE TABLE IF NOT EXISTS `journalist` (
    `journalistNo` INT NOT NULL AUTO_INCREMENT,
    `journalistName` VARCHAR(50) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `salary` INT NOT NULL,
    `newspaperNo` INT NOT NULL
);
CREATE TABLE IF NOT EXISTS `newspaper` (
    `newspaperNo` INT NOT NULL AUTO_INCREMENT,
    `newspaperName` VARCHAR(50) NOT NULL,
    `journalistNo` INT NOT NULL
);
CREATE TABLE IF NOT EXISTS `article` (
    `articleNo` INT NOT NULL AUTO_INCREMENT,
    `articleTitle` VARCHAR(50) NOT NULL,
    `articleTopic` VARCHAR(50) NOT NULL,
    `newspaperNo` INT NOT NULL
);
CREATE TABLE IF NOT EXISTS `writer` (
    `journalistNo` INT NOT NULL,
    `articleNo` INT NOT NULL
);

/*
 * 2. Alter tables to add the corresponding primary and foreign keys.
 */
ALTER TABLE `journalist` ADD PRIMARY KEY (`journalistNo`);
ALTER TABLE `newspaper` ADD PRIMARY KEY (`newspaperNo`);
ALTER TABLE `article` ADD PRIMARY KEY (`articleNo`);
ALTER TABLE `writer` ADD PRIMARY KEY (`journalistNo`,`articleNo`);
ALTER TABLE `journalist` ADD FOREIGN KEY (`newspaperNo`) REFERENCES `newspaper` (`newspaperNo`);
ALTER TABLE `newspaper` ADD FOREIGN KEY (`journalistNo`) REFERENCES `journalist` (`journalistNo`);
ALTER TABLE `article` ADD FOREIGN KEY (`newspaperNo`) REFERENCES `newspaper` (`newspaperNo`);
ALTER TABLE `writer` ADD FOREIGN KEY (`journalistNo`) REFERENCES `journalist` (`journalistNo`);
ALTER TABLE `writer` ADD FOREIGN KEY (`articleNo`) REFERENCES `article` (`articleNo`);


/*
 * 3. Add the field Number-of-words to the Article table with the constraint: number of
   words must be an integer greater than 100 and less than 1000.
 */
ALTER TABLE `article` ADD `number_of_words` INT NOT NULL;
ALTER TABLE `article` ADD CONSTRAINT `number_of_words` CHECK (`number_of_words` > 100 AND `number_of_words` < 1000);

/*
 * 4. Retrieve the number of newspapers that are found within the Article table.
 */
SELECT COUNT(DISTINCT newspaperNo)
FROM article;

/*
 * 5. Give the name and address of all journalists who write articles in “Education” topic.
 */
SELECT journalistName, address 
FROM journalist, article, writer 
WHERE journalist.journalistNo = writer.journalistNo
AND article.articleNo = writer.articleNo
AND article.articleTopic = 'Education';

/*
 * 6. For each newspaper, give the average salary of all journalists.
 */
SELECT newspaperName, AVG(salary) AS average_salary
FROM journalist, newspaper
WHERE journalist.newspaperNo = newspaper.newspaperNo
GROUP BY newspaperName;

/*
 * 7. Give the names of journalists who have not written any article.
 */
SELECT journalistName
FROM journalist
WHERE journalist.journalistNo NOT IN (SELECT journalistNo FROM writer);

/*
 * 8. For every article in “Sport” topic, list the article number, the newspaper name and the
 * name of the chief editor of this newspaper and his address.
 */
SELECT article.articleNo, newspaper.newspaperName, journalist.journalistName, journalist.address
FROM journalist, article, newspaper
WHERE article.newspaperNo = newspaper.newspaperNo
AND newspaper.journalistNo = journalist.journalistNo
AND article.articleTopic = 'Politics';

/*
 * 9. Give the names of journalists who write articles in the newspaper number 18.
 */
SELECT journalistName
FROM journalist, article, writer, newspaper
WHERE journalist.journalistNo = writer.journalistNo
AND writer.articleNo = article.articleNo
AND article.newspaperNo = newspaper.newspaperNo
AND newspaper.newspaperNo = 18;

/*
 * 10. Give the article number (articleNo) of articles that involves a journalist whose name
 * is “Karim” or belongs to a newspaper whose chief editor’s name is “Karim”.
 */
SELECT article.articleNo
FROM article, journalist, writer, newspaper
WHERE journalist.journalistNo = writer.journalistNo
AND writer.articleNo = article.articleNo
AND journalist.newspaperNo = newspaper.newspaperNo
AND (journalist.journalistNo = 'Karim' OR newspaper.journalistNo = (SELECT journalistNo FROM journalist WHERE journalistName = 'Karim'));

/*
 * 11. Give the names of journalists who participate in writing two articles that belong to the
 * same newspaper.
 */
SELECT journalist.journalistName
FROM journalist, article, writer, newspaper
WHERE journalist.journalistNo = writer.journalistNo
AND writer.articleNo = article.articleNo
AND article.newspaperNo = newspaper.newspaperNo
AND journalist.journalistNo IN (SELECT journalistNo FROM writer GROUP BY journalistNo HAVING COUNT(journalistNo) > 1);

/*
 * 12. Give the names of journalists who participate in writing an article that belongs to a
 * newspaper different from their newspapers.
 */
SELECT journalist.journalistName
FROM journalist, article, writer, newspaper
WHERE journalist.journalistNo = writer.journalistNo
AND writer.articleNo = article.articleNo
AND article.newspaperNo = newspaper.newspaperNo
AND journalist.newspaperNo != newspaper.newspaperNo;
