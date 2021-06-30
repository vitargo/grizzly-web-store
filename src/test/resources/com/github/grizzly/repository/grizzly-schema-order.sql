drop table if exists public.orders CASCADE;

create table orders
(
    id          bigint generated by default as identity,
    create_date timestamp,
    modify_date timestamp,
    status      varchar(32),
    user_id     bigint,
    primary key (id),
    FOREIGN KEY(USER_ID) REFERENCES PUBLIC.USERS(ID)
);

drop table if exists public.users CASCADE;

create table users
(
    id          bigint generated by default as identity,
    active      VARCHAR(16) not null,
    created_at  timestamp   not null,
    email       VARCHAR(32) not null,
    first_name  VARCHAR(32) not null,
    last_name   VARCHAR(32) not null,
    login       VARCHAR(32) not null,
    password    VARCHAR(16) not null,
    phone       VARCHAR(16) not null,
    updated_at  timestamp,
    is_verified VARCHAR(16) not null,
    primary key (id)
);

drop table if exists public.order_items CASCADE;

create table order_items
(
    id         bigint generated by default as identity,
    price      numeric(11, 2),
    quantity   integer,
    order_id   bigint    not null,
    product_id bigint generated by default as identity,
    primary key (id),
    FOREIGN KEY(ORDER_ID) REFERENCES PUBLIC.orders(ID),
    FOREIGN KEY(product_id) REFERENCES PUBLIC.products(ID)
);

drop table if exists public.products CASCADE;

create table products
(
    id          bigint generated by default as identity,
    description varchar(256),
    image       varchar(255),
    name        varchar(64),
    price       numeric(19, 2),
    quantity    integer,
    category_id bigint,
    primary key (id)
);

drop table if exists public.category CASCADE;

create table category
(
    id          bigint generated by default as identity,
    description varchar(256) not null,
    name        varchar(32)  not null,
    parent_id   bigint,
    primary key (id)
);