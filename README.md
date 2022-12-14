# Advanced Database Final Project

## Student:

- Name: **Guy Abou Nader**
- ID: **20200028**

- Email: **guy.nader.std@aku.edu.lb**

## Project Description

### Consider the following database

- Journalist (journalistNo, journalistName, address, salary, newspaperNo)
- Newspaper (newspaperNo, newspaperName, journalistNo)
- Article (articleNo, articleTitle, articleTopic, newspaperNo)
- Writer (journalistNo, articleNo)

### N.B.:

• The articleTopic in Article table specify the topic of the article, exp. Education, Sport,
Social, etc.
• journalistNo in Newspaper table represents the Chief Editor of the newspaper.
• newspaperNo in Article table refers to the newspaper where the article is published.
• A journalist that works in a newspaper can write an article published in another
newspaper.
• An article can be written by one or more journalists.

## Database creation

1. Write SQL statements to create the above relations without specifying the primary and
foreign keys. Choose the appropriate type for each attribute.
2. Alter tables to add the corresponding primary and foreign keys.

## Formulate the following queries in SQL

3. Add the field Number-of-words to the Article table with the constraint: number of
words must be an integer greater than 100 and less than 1000.
4. Retrieve the number of newspapers that are found within the Article table.
5. Give the name and address of all journalists who write articles in “Education” topic.
6. For each newspaper, give the average salary of all journalists.
7. Give the names of journalists who have not written any article.
8. For every article in “Sport” topic, list the article number, the newspaper name and the
name of the chief editor of this newspaper and his address.
9. Give the names of journalists who write articles in the newspaper number 18.
10. Give the article number (articleNo) of articles that involves a journalist whose name
is “Karim” or belongs to a newspaper whose chief editor’s name is “Karim”.
11. Give the names of journalists who participate in writing two articles that belong to the
same newspaper.
12. Give the names of journalists who participate in writing an article that belongs to a
newspaper different from their newspapers.

## Project Solution

### 1. SQL queries:

Check the file [finals-project.sql](finals-project.sql).

### 2. Text file:

Check the file [finals-project.txt](finals-project.txt).

### 3. DB Design:

Check this link: [DB Design](https://dbdesigner.page.link/kiXo4ZKiWw4i7D4d7).
