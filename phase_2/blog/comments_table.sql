CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  blogger text,
  title text,
  content text
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  username text,
  content text,
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);