CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  email varchar NOT NULL,
  username varchar NOT NULL,
  password varchar NOT NULL,
  created_at timestamp with time zone NOT NULL,
  UNIQUE (email, username)
);

 INSERT INTO users (id, email, username, password, created_at) VALUES
 (1, 'admin@163.com', 'admin', 'admin','2017-07-23 23:41:45.672805609 +08:00'),
 (2, 'zzzz@163.com', 'zzzz', 'zzzz','2017-07-23 23:41:45.672805609 +08:00'),
 (3, 'aaaa@163.com', 'aaaa', 'aaaa','2017-07-23 23:41:45.672805609 +08:00');
 SELECT setval('users_id_seq', 3, true);


CREATE TABLE  article (
  id SERIAL NOT NULL PRIMARY KEY,
  uid integer NOT NULL,
  category varchar NOT NULL,
  status integer NOT NULL DEFAULT '0',
  comments_count integer NOT NULL DEFAULT '0',
  title varchar NOT NULL,
  raw text NOT NULL,
  cooked text NOT NULL,
  created_at timestamp with time zone NOT NULL,
  updated_at timestamp with time zone  NOT NULL 
);

 INSERT INTO article (id, uid, category, status, comments_count, title, raw, cooked, created_at, updated_at) VALUES
 (1, 1, 'Topic', 0, 2, 'Rust Article', 'Rust 2017 Survey Results', 'Rust 2017 Survey Results', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (2, 2, 'Article', 0, 3, 'The Rust Libz Blitz','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (3, 2, 'FAQ', 0, 1, 'Rust 2017 roadmap','This year, the overarching theme is productivity, especially for early-stage Rust users. ','This year, the overarching theme is productivity, especially for early-stage Rust users. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (4, 1, 'Share', 0, 1, 'Incremental Compilation', 'One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ','One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (5, 2, 'Job', 0, 1, 'Rust jobs','Today we are announcing an alpha version of incremental compilation','Today we are announcing an alpha version of incremental compilation', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (6, 2, 'Blog', 0, 0, 'Introducing MIR','MIR is the key to ticking off a number of our highest priorities for Rust','MIR is the key to ticking off a number of our highest priorities for Rust', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (7, 1, 'Topic', 0, 2, 'Rust Article', 'Rust 2017 Survey Results', 'Rust 2017 Survey Results', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (8, 2, 'Article', 0, 3, 'The Rust Libz Blitz','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (9, 2, 'FAQ', 0, 1, 'Rust 2017 roadmap','This year, the overarching theme is productivity, especially for early-stage Rust users. ','This year, the overarching theme is productivity, especially for early-stage Rust users. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (10, 1, 'Share', 0, 1, 'Incremental Compilation', 'One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ','One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (11, 2, 'Job', 0, 1, 'Rust jobs','Today we are announcing an alpha version of incremental compilation','Today we are announcing an alpha version of incremental compilation', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (12, 2, 'Blog', 0, 0, 'Introducing MIR','MIR is the key to ticking off a number of our highest priorities for Rust','MIR is the key to ticking off a number of our highest priorities for Rust', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (13, 1, 'Topic', 0, 2, 'Rust Article', 'Rust 2017 Survey Results', 'Rust 2017 Survey Results', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (14, 2, 'Article', 0, 3, 'The Rust Libz Blitz','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (15, 2, 'FAQ', 0, 1, 'Rust 2017 roadmap','This year, the overarching theme is productivity, especially for early-stage Rust users. ','This year, the overarching theme is productivity, especially for early-stage Rust users. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (16, 1, 'Share', 0, 1, 'Incremental Compilation', 'One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ','One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (17, 2, 'Job', 0, 1, 'Rust jobs','Today we are announcing an alpha version of incremental compilation','Today we are announcing an alpha version of incremental compilation', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (18, 2, 'Blog', 0, 0, 'Introducing MIR','MIR is the key to ticking off a number of our highest priorities for Rust','MIR is the key to ticking off a number of our highest priorities for Rust', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00');
 SELECT setval('article_id_seq', 18, true);


CREATE TABLE  comment (
  id SERIAL NOT NULL PRIMARY KEY,
  aid integer NOT NULL,
  uid integer NOT NULL,
  raw text NOT NULL,
  cooked text NOT NULL,
  created_at timestamp with time zone NOT NULL
);

 INSERT INTO comment (id, aid, uid, raw, cooked, created_at) VALUES
 (1, 1, 1, 'Faster execution time','Faster execution time', '2017-07-23 23:41:45.672805609 +08:00'),
 (2, 1, 1, 'Faster compilation time','Faster compilation time', '2017-07-23 23:41:45.672805609 +08:00'),
 (3, 3, 2, 'More precise type checking.','More precise type checking.', '2017-07-23 23:41:45.672805609 +08:00'),
 (4, 2, 2, 'Eliminating redundancy！','Eliminating redundancy！', '2017-07-23 23:41:45.672805609 +08:00'),
 (5, 4, 2, 'Raising ambitions.！','Raising ambitions.！', '2017-07-23 23:41:45.672805609 +08:00'),
 (6, 5, 2, 'MIR construction is type-driven','MIR construction is type-driven', '2017-07-23 23:41:45.672805609 +08:00'),
 (7, 2, 2, 'Some MIR primitives are more powerful than the structured construct they replace','Some MIR primitives are more powerful than the structured construct they replace', '2017-07-23 23:41:45.672805609 +08:00'),
 (8, 2, 2, 'MIR makes all types explicit','MIR makes all types explicit', '2017-07-23 23:41:45.672805609 +08:00'),
 (9, 1, 1, 'Faster execution time','Faster execution time', '2017-07-23 23:41:45.672805609 +08:00'),
 (10, 1, 1, 'Faster compilation time','Faster compilation time', '2017-07-23 23:41:45.672805609 +08:00'),
 (11, 3, 2, 'More precise type checking.','More precise type checking.', '2017-07-23 23:41:45.672805609 +08:00'),
 (12, 2, 2, 'Eliminating redundancy！','Eliminating redundancy！', '2017-07-23 23:41:45.672805609 +08:00'),
 (13, 4, 2, 'Raising ambitions.！','Raising ambitions.！', '2017-07-23 23:41:45.672805609 +08:00'),
 (14, 5, 2, 'MIR construction is type-driven','MIR construction is type-driven', '2017-07-23 23:41:45.672805609 +08:00'),
 (15, 2, 2, 'Some MIR primitives are more powerful than the structured construct they replace','Some MIR primitives are more powerful than the structured construct they replace', '2017-07-23 23:41:45.672805609 +08:00'),
 (16, 2, 2, 'MIR makes all types explicit','MIR makes all types explicit', '2017-07-23 23:41:45.672805609 +08:00'),
 (17, 1, 1, 'Faster execution time','Faster execution time', '2017-07-23 23:41:45.672805609 +08:00'),
 (18, 1, 1, 'Faster compilation time','Faster compilation time', '2017-07-23 23:41:45.672805609 +08:00'),
 (19, 3, 2, 'More precise type checking.','More precise type checking.', '2017-07-23 23:41:45.672805609 +08:00'),
 (20, 2, 2, 'Eliminating redundancy！','Eliminating redundancy！', '2017-07-23 23:41:45.672805609 +08:00'),
 (21, 4, 2, 'Raising ambitions.！','Raising ambitions.！', '2017-07-23 23:41:45.672805609 +08:00'),
 (22, 5, 2, 'MIR construction is type-driven','MIR construction is type-driven', '2017-07-23 23:41:45.672805609 +08:00'),
 (23, 2, 2, 'Some MIR primitives are more powerful than the structured construct they replace','Some MIR primitives are more powerful than the structured construct they replace', '2017-07-23 23:41:45.672805609 +08:00'),
 (24, 2, 2, 'MIR makes all types explicit','MIR makes all types explicit', '2017-07-23 23:41:45.672805609 +08:00');
 SELECT setval('comment_id_seq', 24, true);


CREATE TABLE message (
  id SERIAL NOT NULL PRIMARY KEY,
  aid integer NOT NULL,
  cid integer NOT NULL,
  from_uid integer NOT NULL,
  to_uid integer NOT NULL,
  raw text NOT NULL,
  cooked text NOT NULL,
  mode integer NOT NULL DEFAULT '0',
  status integer NOT NULL DEFAULT '0',
  created_at timestamp with time zone NOT NULL
);


CREATE TABLE  wiki (
  id SERIAL NOT NULL PRIMARY KEY,
  category varchar NOT NULL,
  title varchar NOT NULL,
  raw text NOT NULL,
  cooked text NOT NULL,
  created_at timestamp with time zone NOT NULL,
  updated_at timestamp with time zone  NOT NULL 
);

 INSERT INTO wiki (id, category, title, raw, cooked, created_at, updated_at) VALUES
 (1, 'Docs', 'Rust Article', 'Rust 2017 Survey Results', 'Rust 2017 Survey Results', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (2, 'Resources', 'The Rust Libz Blitz','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (3, 'Web', 'Rust 2017 roadmap','This year, the overarching theme is productivity, especially for early-stage Rust users. ','This year, the overarching theme is productivity, especially for early-stage Rust users. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (4, 'Embed', 'Incremental Compilation', 'One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ','One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (5, 'Server', 'Rust jobs','Today we are announcing an alpha version of incremental compilation','Today we are announcing an alpha version of incremental compilation', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (6, 'Client', 'Introducing MIR','MIR is the key to ticking off a number of our highest priorities for Rust','MIR is the key to ticking off a number of our highest priorities for Rust', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (7, 'Docs', 'Rust Article', 'Rust 2017 Survey Results', 'Rust 2017 Survey Results', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (8, 'Resources', 'The Rust Libz Blitz','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (9, 'Web', 'Rust 2017 roadmap','This year, the overarching theme is productivity, especially for early-stage Rust users. ','This year, the overarching theme is productivity, especially for early-stage Rust users. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (10, 'Embed', 'Incremental Compilation', 'One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ','One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (11, 'Server', 'Rust jobs','Today we are announcing an alpha version of incremental compilation','Today we are announcing an alpha version of incremental compilation', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (12, 'Client', 'Introducing MIR','MIR is the key to ticking off a number of our highest priorities for Rust','MIR is the key to ticking off a number of our highest priorities for Rust', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (13, 'Docs', 'Rust Article', 'Rust 2017 Survey Results', 'Rust 2017 Survey Results', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (14, 'Resources', 'The Rust Libz Blitz','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ','This post covers the library team’s major initiative: raising a solid core of the Rust crate ecosystem to a consistent level of completeness and quality. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (15, 'Web', 'Rust 2017 roadmap','This year, the overarching theme is productivity, especially for early-stage Rust users. ','This year, the overarching theme is productivity, especially for early-stage Rust users. ', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (16, 'Embed', 'Incremental Compilation', 'One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ','One of the projects that is building on these foundations, and that should help improve compile times a lot for typical workflows, is incremental compilation. ', '2017-07-24 23:41:45.672805609 +08:00', '2017-07-23 23:41:45.672805609 +08:00'),
 (17, 'Server', 'Rust jobs','Today we are announcing an alpha version of incremental compilation','Today we are announcing an alpha version of incremental compilation', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00'),
 (18, 'Client', 'Introducing MIR','MIR is the key to ticking off a number of our highest priorities for Rust','MIR is the key to ticking off a number of our highest priorities for Rust', '2017-07-23 23:41:45.672805609 +08:00', '2017-07-24 23:41:45.672805609 +08:00');
 SELECT setval('wiki_id_seq', 18, true);