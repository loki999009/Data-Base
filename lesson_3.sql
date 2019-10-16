

drop table if exists vk;
create database if not exists vk;
use vk;

drop table if exists users;
create table users(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100) comment 'Фамилия',
    email VARCHAR(120) UNIQUE,
    password_hash VARCHAR(100),
    -- phone VARCHAR(12)
    phone bigint,

    -- первичные ключи
    -- индуксы
    -- внешние ключи
    -- INDEX user_phone_idx(phone),
    INDEX (phone),
    INDEX (firstname, lastname) -- для быстрого поиска людей по ФИО
);

drop table if exists `profiles`;
create table `profiles`(
    user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    photo_id BIGINT UNSIGNED NULL,
    hometown VARCHAR(100),
    create_at DATETIME DEFAULT NOW()
);

alter table `profiles`
    add constraint fk_user_id
    foreign key (user_id) references users(id)
    on update CASCADE
    on delete RESTRICT
;
drop table if exists messages;
create table messages(
    id SERIAL PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    create_at DATETIME DEFAULT NOW()

    index (from_user_id),
    index (to_user_id),
    foreign key (from_user_id) references user(id),
    foreign key (to_user_id) references user(id)
);
drop table if exists friend_requests;
create table friend_requests(
    intiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    status ENUM('requested', 'approved', 'declined', 'unfriended'),
    requested_at DATATIME DEFAULT NOW(),
    updated_at DATETIME,

    primary key (intiator_user_id, target_user_id), --составной ключ
    index (intiator_user_id),
    index (target_user_id),
    foreign key (intiator_user_id) references users(id),
    foreign key (target_user_id) references users(id)

);

drop table if exists communities;
creat table communities(
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),

    INDEX (name)
);

drop table if exists users_communities;
creat table users_communities(
    user_id BIGINT UNSIGNED NOT NULL,
    community_id BIGINT UNSIGNED NOT NULL,

    primary key (user_id, community_id), --  составной первичный ключ
    foreign key (user_id) references users(id),
    foreign key (community_id) references users(id)
);