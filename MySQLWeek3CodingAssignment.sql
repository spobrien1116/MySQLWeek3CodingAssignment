drop database if exists w3smdatabase;
create database if not exists w3smdatabase;

use w3smdatabase;

CREATE TABLE users (
	u_id int(11) not null auto_increment,
	username varchar(20) not null,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	email varchar(50) not null,
	password varchar(30) not null,
	primary key (u_id)
);

CREATE TABLE posts (
	p_id int(20) not null auto_increment,
	user_id int(11) not null,
    username varchar(20) not null,
	post_name varchar(100) not null,
	post_content text(65535) not null,
	post_time datetime default current_timestamp,
	primary key (p_id),
	foreign key (user_id) references users(u_id)
);

CREATE TABLE comments (
	c_id int(30) not null auto_increment,
    user_id int(11) not null,
    post_id int(20) not null,
    username varchar(20) not null,
    comment_content text(65535) not null,
    comment_time datetime default current_timestamp,
    primary key (c_id),
    foreign key (user_id) references users(u_id),
    foreign key (post_id) references posts(p_id)
);

