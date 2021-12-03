-- Create Database --
create database skilvulbookstore;

-- Use Database --
use skilvulbookstore;

-- Create Table Penerbit --
create table penerbit (
    id int not null auto_increment primary key,
    nama varchar(50),
    kota varchar(50)
);

-- Create Table Penulis --
create table penulis (
    id int not null auto_increment primary key,
    nama varchar(50),
    kota varchar(50)
);

-- Create Table Buku --
create table buku (
    id int not null auto_increment primary key,
    ISBN varchar(50),
    judul varchar(50),
    penulis varchar(50),
    penerbit int,
    harga int,
    stock int,
    constraint fk_buku_penulis_id foreign key(id) references penulis(id),
    constraint fk_buku_penerbit_penerbit foreign key(penerbit) references penerbit(id)
);
 
-- Insert penerbit--
insert into penerbit (nama, kota)
values ('Gramedia', 'Jakarta'),
       ('Andi Publisher', 'Yogyakarta'),
       ('Erlangga', 'Jakarta');

-- Insert penulis --
insert into penulis (nama, kota)
values ('Tere Liye', 'Jkarta'),
       ('Haidar Musyafa', 'Jakarta'),
       ('Andrea Hirata', 'Jakarta');

-- Insert buku --
insert into buku (isbn, judul, penulis, penerbit, harga, stock)
values ('978-602-8519-93-9', 'Bintang', 1, 1, 99000, 100),
       ('978-602-8519-93-8', 'Komet', 1, 1, 100000, 9),
       ('978-602-8519-93-7', 'Ayah', 3, 2, 150000, 15);

-- Inner Join --
select * from buku inner join penerbit on buku.penerbit = penerbit.id;

-- Left Join --
select * from buku left join penerbit on buku.penerbit = penerbit.id;

-- Right Join --
select * from buku right join penerbit on buku.penerbit = penerbit.id;

-- MAX --
select max(harga) from buku where stock < 10;

-- MIN --
select min(harga) from buku;

-- Count --
select count(id) from buku where harga < 100000;