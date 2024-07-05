---- DDL----
-- 2a. Create table user
create table users (
id serial,
nama varchar(255),
alamat varchar(255),
tanggal_lahir date,
status_user boolean,
gender varchar(10),
created_at timestamp,
updated_at timestamp,

primary key(id)
);

-- 2b. Create table product, product_type, product_description, payment_method
create table product (
id serial, 
product varchar(255),
product_type_id int,
product_description_id int,
merk_id int,
price numeric(12, 2),
created_at timestamp,
updated_at timestamp,

primary key(id),
foreign key(product_type_id) references product_type(id),
foreign key(product_description_id) references product_description(id),
foreign key(merk_id) references merk(id)
);

create table product_type (
id serial,
product_type_name varchar(255),

primary key(id)
);

create table product_description(
id serial,
description text,

primary key(id)
);

create table merk(
id serial,
merk_name varchar(255),

primary key(id)
);

create table payment_method(
id serial,
method_name varchar(255),
primary key(id)
);

-- 2c. Create table transaction, transaction_detail 
create table transaction(
id serial,
user_id int,
payment_method_id int,
transaction_date timestamp,
primary key(id),
foreign key (user_id) references users(id),
foreign key (payment_method_id) references payment_method(id)
);

create table transaction_detail(
id serial,
transaction_id int,
product_id int,
quantity int,
total_price numeric(15, 2),

primary key(id),
foreign key(transaction_id) references transaction(id),
foreign key(product_id) references product(id)
);

-- 3 create table kurir dengan field id, name, created_at, updated_at
create table kurir(
id serial,
name varchar(255),
created_at timestamp,
updated_at timestamp
);

-- 4 tambahkan ongkos dasar di tabel kurir
alter table kurir add column ongkos_dasar numeric(10,2);

-- 5 rename table kurir jadi shipping
alter table kurir rename to shipping;

-- 6 Hapus tabel shipping karena tidak dibutuhkan
drop table shipping;