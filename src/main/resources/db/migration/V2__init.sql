create table if not exists categories
(
    id    bigserial primary key,
    title varchar(255) not null unique,
    description text,
    image_url varchar(255),
    parent_id bigint references categories (id)
);

create table if not exists attributes
(
    id bigserial primary key,
    title varchar(255) not null
);

create table if not exists attribute_values
(
    id bigserial primary key,
    title varchar(255) not null,
    attribute_id bigint references attributes (id)
);

create table if not exists  products
(
    id          bigserial primary key,
    title       varchar(255) not null,
    description text,
    price       real not null,
    image_url varchar(255),
    category_id bigint references categories (id)
);

create table if not exists product_attributes
(
    product_id bigint references products (id),
    attribute_value_id bigint references attribute_values (id),
    constraint product_attributes_unique unique (product_id, attribute_value_id)
);

create table if not exists orders
(
    id bigserial primary key,
    customer_id bigint references users (id),
    price real not null,
    order_status smallint,
    shipping_method smallint,
    address text,
    contact_email varchar(255),
    creation_time timestamp,
    deliver_time  timestamp,
    details text
);

create table if not exists order_items
(
    id bigserial primary key,
    order_id bigint references orders (id),
    product_id bigint references products (id),
    price real not null,
    quantity integer
);

create table if not exists customer_addresses
(
    id          bigserial primary key,
    address     text not null,
    customer_id bigint references users (id)
);

INSERT INTO categories (title)
VALUES ('Электроника'),
       ('Бытовая техника');

INSERT INTO products(title, price, category_id)
VALUES ('Ноутбук Lenovo', 44990, 1),
       ('Телефон iPhone', 66490, 1),
       ('Стиральная машинка LG', 32290, 2),
       ('Телевизор Samsung', 32290, 1);
