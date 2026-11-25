create database QLSV
use QLSV

create table LOP(
	MaLop char(10) not null,
	TenLop nvarchar(50),
	SiSo int,
	constraint PL_Lop primary key(MaLop)
);

create table SINHVIEN(
	MaSV char(10) not null,
	TenSV nvarchar(50),
	Phai nchar(10),
	NgaySinh date,
	DiaChi nvarchar(100),
	MaLop char(10),
	constraint PK_SINHVIEN primary key(MaSV),
	constraint FK_SINHVIEN_LOP foreign key(MaLop) references LOP(MaLop)
);