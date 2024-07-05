----- DML -----

---- Insert
-- 1a. insert 3 product type
insert into product_type (product_type_name)
values
('fashion'),
('elektronik'),
('mebel');

--merk--
insert into merk(merk_name)
values
('woles'),
('enjoy'),
('samsung'),
('hp'),
('apple'),
('ceria');

-- b. insert 2 product dengan type id = 1
insert into product(product, product_type_id, product_description_id, merk_id, price, created_at, updated_at)
values
('Kaos Polos', 1, 1, 1, 29000.00, now(), now()),
('Celana Santai', 1, 2, 2, 30000.00, now(), now());


-- c. insert 3 product dengan type id = 2
insert into product(product, product_type_id, product_description_id, merk_id, price, created_at, updated_at)
values
('Smartphone', 2, 3, 3, 1000000.00, now(), now()),
('Laptop', 2, 4, 4, 2000000.00, now(), now()),
('Tablet', 2, 5, 5, 1500000.00, now(), now());

-- d. insert 3 product dengan type id = 3
INSERT INTO product (product, product_type_id, product_description_id, merk_id, price, created_at, updated_at)
VALUES
('Kursi Plastik', 3, 6, 6, 58000.00, now(), now()),
('Meja Lasehan', 3, 7, 6, 140000.00, now(), now()),
('Lemari Pakaian', 3, 8, 6, 1500000.00, now(), now());


-- e. insert product description pada setiap product
insert into product_description (description)
values
('Bahan: Katun, Gaya Pakaian: Basic, Kerah: Kerah Bulat, Model Penutup: Tanpa Kancing, Panjang Lengan: Lengan Pendek'),
('PREMIUM CELANA SANTAI BOXER, ukuran ALL SIZE (Fit to XL, Ukuran 27 - 34) BAHAN KATUN, BISA DIPAKAI COWOK/CEWEK'),
('Mediatek Helio G25 (MT6762V/CB), NFC, Layar 6,52 inci HD+, Kapasitas RAM 3GB dan ROM 32GB, Baterai 5000mAh, Kualitas Jepang'),
('Processor: AMD Ryzen 3 7320U, Processor Family: AMD Ryzen 3 processor, Internal Storage: 256 GB, Color: Dark ash silver'),
('HUAWEI MatePad Air Tablet [8+128G] | PC-Level Productivity | 144Hz 2.8K 3:2 FullView Display | Flagship-level Performance'),
('Dimensi produk : Lebar bagian atas 27 cm, Lebar bagian bawah 36 cm, Tinggi 46 cm'),
('Bahan : Multriplek + kayu jati belanda ( kuat Dan Awet), Ukuran : 120X50X30, Model : meja lesehan kaki miring, Warna: Natural Glosy'),
('Bahan: kain non-woven + plastik + besi, 2-Row: ukuran produk: 88*45*170cm, Berat kotor: 2,3kg, 4-Row: ukuran produk: 174*45*169cm');

-- f. insert 3 payment methods
insert into payment_method(method_name)
values
('Cash On Delivery') ,
('Go Pay'),
('Transfer Bank');
 
-- g. insert 5 user pada tabel user
insert  into users(nama, alamat, tanggal_lahir, status_user, gender, created_at, updated_at)
values
('aldo', 'jl kalianyar', '2001-09-22', True, 'm', CURRENT_TIMESTAMP - INTERVAL '7 days', now()),
('putri', 'jl tangerang', '2002-08-22', True, 'f', CURRENT_TIMESTAMP - INTERVAL '7 days', now()),
('febri', 'jl duri', '2001-08-22', False, 'm', CURRENT_TIMESTAMP - INTERVAL '30 days', now()),
('alvi', 'jl gajah mada', '2001-08-22', True, 'm', CURRENT_TIMESTAMP - INTERVAL '7 days', now()),
('nisa', 'jl kerendang', '1999-08-22', True, 'f', CURRENT_TIMESTAMP - INTERVAL '30 days', now());


-- h. insert 3 transaksi di masing-masing user (min 3 user)
insert  into transaction(user_id, payment_method_id, transaction_date)
values
(1, 2, CURRENT_TIMESTAMP - INTERVAL '6 days'),
(2, 2, CURRENT_TIMESTAMP - INTERVAL '5 days'),
(4, 2, CURRENT_TIMESTAMP - INTERVAL '4 days'),
(5, 2, now()),
(2, 3, now()),
(2, 3, now()),
(4, 1, now()),
(5, 2, now());

-- I. insert 3 product di masing-masing transaksi 
select * from transaction_detail td 

insert  into transaction_detail (transaction_id, product_id, quantity, total_price)
values
(1, 3, 2, 2000000.00),
(2, 3, 2, 2000000.00),
(3, 3, 2, 2000000.00),
(4, 3, 2, 2000000.00),
(5, 2, 3, 90000.00),
(6, 6, 2, 116000.00),
(7, 3, 1, 1000000.00),
(8, 3, 1, 1000000.00);


-- 2. Select
-- a. Tampilkan nama user/ pelanggan dengan gender laki-laki
select nama from users 
where gender = 'm'

-- b. Tampilkan product dengan id=3
select product from product
where id = 3

-- c. tampilkan data pelanggan yang created_at range 7 hari kebelakang dan mempunyai nama mengandung kaya 'a'
select u.* from users u
where created_at >= current_date - interval '7 days' 
AND created_at < current_date 
and u.nama ilike '%a%';

-- d. hitung jumlah user/pelanggan dengan status gender perempuan.
select count(gender) as count_female from users
where gender = 'f';


-- e. tampilkan data pelanggan dengan urutan sesuai nama abjad
select * from users 
order by nama asc

--- f. tampilkan 5 data transaksi dengan product id= 3 
select * from transaction_detail 
where product_id = 3
limit 5

--- 3. Update
--- 3a. Ubah data product id 1 dengan nama 'product dummy'
update product set product='product dummy' where id = 1;

--- 3b. update qty = 3 pada transaction detail dengan product id 1.
update transaction_detail set quantity = 3 where id = 1

-- 4 delete
-- 4a. delete data pada tabel product dengan id 1.
delete from product where id=1;


-- 4b. delete pada tabel product dengan product-type id 1.

delete from product where product_type_id = 1;

/*
-- Release 2: Join, Union, Sub-query, function
*/ 

-- 1. gabungkan data transaksi dari user id 1 dan user id 2
select * from transaction where user_id = 1
union 
select * from transaction where user_id = 2

-- 2. tampilkan jumlah harga transaksi user id 1

SELECT SUM(td.total_price) AS total_harga_transaksi
FROM transaction t
JOIN transaction_detail td ON t.user_id = td.transaction_id
WHERE t.user_id = 1;

-- 3. tampilkan total transaksi dengan product type 2
select sum(td.total_price) as total_transaksi_type_2
from product p 
join transaction_detail td on p.id = td.product_id 
where p.product_type_id = 2

-- 4. tampilkan semua field table product dan field name table product type yang saling berhubungan
select p.*, pt.product_type_name 
from product p 
left join product_type pt 
on p.product_type_id = pt.id 

-- 5. tampilkan semua field table transaction, field name table product dan field name table user
select t.*, p.product as product_name, u.nama from "transaction" t 
join users u ON t.user_id = u.id 
join transaction_detail td on t.id = td.transaction_id 
join product p on td.product_id = p.id

-- 6. tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query
select * from product p
where p.id NOT IN (
    select td.product_id
    FROM transaction_detail td
);

-- 7. Terapkan otomasi menggunakan function trigger pada kolom updated_at di semua table dan contohkan hasilnya
create or replace function
trigger_set_timestamp()
returns trigger as $$
begin 
	new.updated_at = now();
	return new;
end;
$$ language plpgsql;


--- trigger untuk users
create trigger set_timestamp
before update on users
for each row
execute procedure
trigger_set_timestamp();

--- Trigger untuk product
create trigger set_timestamp
before update on product
for each row
execute procedure
trigger_set_timestamp();

update users set nama = 'Aldo Kusuma' where id = 1
select * from users

update product set price = 60000.00 where id = 6
select * from product 


-- 8. create view yang menghasilkan data yang sama dengan nomor 4
-- tampilkan semua field table product dan field name table product type yang saling berhubungan

create view product_with_type as
select 
    p.id as product_id,
    p.product,
    p.product_type_id,
    p.product_description_id,
    p.merk_id,
    p.price,
    p.created_at,
    p.updated_at,
    pt.product_type_name
from 
    product p
inner join 
    product_type pt ON p.product_type_id = pt.id;