DROP TABLE posts;
CREATE TABLE posts 
(
  id serial NOT NULL,
  title varchar(255),
  body text
);