CREATE TABLE users (
  username varchar(50) NOT NULL,
  Email varchar(100),
  password binary(64),
  createdDate date,
  PRIMARY KEY (username)
);

CREATE TABLE userprofile (
  username varchar(50),
  bio varchar(500),
  KEY username (username),
  CONSTRAINT fk_userprofile_user FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE tweeets (
  tweetid int NOT NULL AUTO_INCREMENT,
  username varchar(50),
  tweeted_at datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_columns (tweetid, username),
  KEY username (username),
  CONSTRAINT fk_tweeets_user FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE followings (
  username varchar(50),
  follow varchar(50),
  UNIQUE KEY unique_columns (username, follow),
  CONSTRAINT fk_followings_user FOREIGN KEY (username) REFERENCES users(username),
  CONSTRAINT fk_followings_follow_user FOREIGN KEY (follow) REFERENCES users(username)
);

CREATE TABLE likes (
  tweetid int NOT NULL,
  username varchar(50),
  UNIQUE KEY unique_columns2 (tweetid, username),
  KEY username (username),
  CONSTRAINT fk_likes_tweeet FOREIGN KEY (tweetid) REFERENCES tweeets(tweetid),
  CONSTRAINT fk_likes_user FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE quotes (
  tweetid int NOT NULL,
  username varchar(50),
  UNIQUE KEY unique_columns (tweetid, username),
  KEY username (username),
  CONSTRAINT fk_quotes_tweeet FOREIGN KEY (tweetid) REFERENCES tweeets(tweetid),
  CONSTRAINT fk_quotes_user FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE retweets (
  tweetid int NOT NULL,
  username varchar(50),
  UNIQUE KEY unique_columns (tweetid, username),
  KEY username (username),
  CONSTRAINT fk_retweets_tweeet FOREIGN KEY (tweetid) REFERENCES tweeets(tweetid),
  CONSTRAINT fk_retweets_user FOREIGN KEY (username) REFERENCES users(username)
);
