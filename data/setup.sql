drop table posts;
drop table threads;
drop table sessions;
drop table users;


create table users (
  id         int auto_increment primary key,
  uuid       varchar(64) not null unique,
  name       varchar(255),
  email      varchar(255) not null unique,
  password   varchar(255) not null,
  created_at timestamp     
);

create table sessions (
  id         int auto_increment primary key,
  uuid       varchar(64) not null unique,
  email      varchar(255),
  user_id    int references users(id),
  created_at timestamp     
);

create table threads (
  id         int auto_increment primary key,
  uuid       varchar(64) not null unique,
  topic      text,
  user_id    int references users(id),
  created_at timestamp         
);

create table posts (
  id         int auto_increment primary key,
  uuid       varchar(64) not null unique,
  body       text,
  user_id    int references users(id),
  thread_id  int references threads(id),
  created_at timestamp    
);