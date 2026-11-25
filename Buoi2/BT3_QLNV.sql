create database QL_NhanVien
use QLNV

drop table PHONGBAN
drop table NHANVIEN
drop table DEAN
drop table PHANCONG
drop table THANNHAN
drop table THENHANVIEN
create table PHONGBAN(
	MAPH char(10) not null,
	TENPH nvarchar(50),
	DIADIEM nvarchar(100),
	constraint PK_PHONGBAN primary key(MAPH)
)

create table NHANVIEN(
	MANV char(10) not null,
	HOTEN nvarchar(50),
	NGAYSINH date,
	DIACHI nvarchar(100),
	PHAI nchar(10),
	LUONG float,
	MANQL char(10),
	MAPH char(10),
	constraint PK_NHANVIEN primary key(MANV),
	constraint FK_NHANVIEN_PHONGBAN foreign key(MAPH) references PHONGBAN(MAPH),
	constraint FK_NHANVIEN_NQL foreign key(MANQL) references NHANVIEN(MANV)
);

alter table NHANVIEN
add LUONG float

create table DEAN(
	MADA char(10) not null,
	TENDA nvarchar(50),
	DIADIEMDA nvarchar(100),
	NGAYBD date,
	constraint PK_DEAN primary key(MADA)
);

create table PHANCONG(
	MANV char(10) not null,
	MADA char(10) not null,
	NGAYPC date,
	constraint PK_PHANCONG primary key(MANV,MADA),
	constraint FK_PHANCONG_NHANVIEN foreign key(MANV) references NHANVIEN(MANV),
	constraint FK_PHANCONG_DEAN foreign key(MADA) references DEAN(MADA)
);

create table THANNHAN(
	MANV char(10) not null,
	TENTN nvarchar(100) not null,
	PHAI nchar(10),
	NGAYSINH date,
	QUANHE nvarchar(50),
	constraint PK_THANNHAN primary key(MANV,TENTN),
	constraint FK_THANHHAN_NHANVIEN foreign key(MANV) references NHANVIEN(MANV)
);

create table THENHANVIEN(
	THENV char(10) not null,
	MANV char(10),
	NGAYCAP date,
	constraint PK_THENHANVIEN primary key(THENV),
	constraint FK_THENHANVIEN_NHANVIEN foreign key(MANV) references NHANVIEN(MANV)
);

alter table THENHANVIEN
add constraint FK_THENHANVIEN_NHANVIEN foreign key(MANV) references NHANVIEN(MANV)

select * from PHONGBAN
select * from NHANVIEN
select * from DEAN
select * from PHANCONG
select * from THANNHAN
select * from THENHANVIEN

insert into PHONGBAN values
('PH001',N'Kế Hoạch', N'Tầng 1 nhà A'),
('PH002',N'Quản trị', N'Tầng 1 nhà B'),
('PH003',N'Nhân sự', N'Tầng 2 nhà A'),
('PH004',N'Tài vụ', N'Tầng 3 nhà A'),
('PH005',N'Đầu tư', N'Tầng 2 nhà B'),
('PH006',N'Vật tư', N'Tầng 3 nhà B'),
('PH007',N'Tư vấn', N'Tầng 3 nhà B')

set dateformat dmy

insert into NHANVIEN values
('NV0001',N'Nguyễn Văn Nam', '12/07/1988', N'Tây Ninh', N'Nam', 15000000,'NV0009', 'PH003'),
('NV0002',N'Nguyễn Kim Anh', '10/02/1990', N'TP.HCM', N'Nam', 8000000,'NV0009', 'PH003'),
('NV0003',N'Nguyễn Thị Châu', '12/10/1979', N'Vũng Tàu', N'Nữ', 12000000,'NV0006', 'PH003'),
('NV0004',N'Trần Văn Út', '23/08/1977', N'Hà Nội', N'Nam', 7000000,'NV0005', 'PH002'),
('NV0005',N'Trần Lệ Quyên', '22/12/1987', N'Hà Nội', N'Nữ',9000000, 'NV0005', 'PH002'),
('NV0006',N'Bùi Đức Chí', '10/11/1987', N'TP.HCM', N'Nam',10000000, 'NV0008', 'PH003'),
('NV0007',N'Nguyễn Tuấn Anh', '06/09/1991', N'Tây Ninh', N'Nam',35000000, 'NV0002', 'PH003'),
('NV0008',N'Đỗ Xuân Thùy', '14/05/1988', N'TP.HCM', N'Nam',21000000, 'NV0002', 'PH002'),
('NV0009',N'Trần Minh Tú', '17/09/1985', N'Đồng Nai', N'Nam',18000000, NULL, 'PH001'),
('NV0010',N'Trần Khánh An', '13/11/1987', N'Khánh Hòa', N'Nữ',12000000, NULL, NULL),
('NV0011',N'Nguyễn Ngọc Phan', '02/06/1995', N'Đồng Nai', N'Nam',13000000, NULL, NULL)
delete NHANVIEN
update NHANVIEN
set PHAI = N'Nữ'
where MANV = 'NV0002'
insert into DEAN values
('DA001', N'Đền bù giải tỏa', N'Phường 12, Q.Tân Bình', '01/01/2015'),
('DA002', N'Giải phóng mặt bằng', N'Phường 12, Q.Tân Bình', '01/06/2015'),
('DA003', N'Cải tạo mặt đường số 9', N'Phường Tây Thạnh, Q.Tân Phú', '01/01/2016'),
('DA004', N'Bắt đầu thi công', N'Phường 26, Q.Bình Thạnh', '04/05/2016'),
('DA005', N'Hoàn thiện mặt bằng', N'Phường Tân Quy, Quận 7', '10/12/2016')

insert into PHANCONG values
('NV0001', 'DA001', '05/02/2015'),
('NV0001', 'DA003', '17/03/2016'),
('NV0003', 'DA003', '01/01/2016'),
('NV0005', 'DA004', '10/05/2016'),
('NV0007', 'DA005', '20/12/2016')

insert into PHANCONG values
('NV0002', 'DA002', '03/05/2018')

insert into THANNHAN values
('NV0001', N'Nguyễn Văn Bình', N'Nam', '22/05/1983', N'Anh'),
('NV0002', N'Nguyễn Chính Nghĩa', N'Nam', '07/03/1988', N'Em'),
('NV0005', N'Lê Anh Hùng', N'Nam', '05/04/1978', N'Chồng'),
('NV0006', N'Bùi Đại An', N'Nam', '22/05/1983', N'Anh'),
('NV0008', N'Lê Thảo Nguyên', N'Nữ', '12/06/1985', N'Vợ'),
('NV0009', N'Trần Thanh Nhàn', N'Nữ', '30/05/1979', N'Chị')

insert into THENHANVIEN values
('TNV001', 'NV0001', '05/03/2018'),
('TNV002', 'NV0002', '17/03/2019'),
('TNV003', 'NV0003', '01/01/2020'),
('TNV004', 'NV0004', '10/05/2020'),
('TNV005', 'NV0005', '20/12/2021')


-----TRUY VẤN------
--Câu 1: tạo bảng ảo hiển thị danh sách nhân viên ngày cạp thẻ nhân viên tương ứng từng nhân viên
create view cau1 
as
select n.MANV, HOTEN, NGAYSINH, DIACHI, PHAI, LUONG, MANQL, MAPH
from NHANVIEN n, THENHANVIEN t
where n.MANV = t.MANV

select * from cau1
--Câu 2: Tìm Những nhân viên....có lương trên 10.000.000
select n.*
from NHANVIEN n
where n.LUONG > 10000000
--Câu 3: Cho biết họ teen của những nhân viên nam ở TP.HCM hoặc nữ ở Hà Nội
select *
from NHANVIEN n
where (n.PHAI = N'Nam' and n.DIACHI = N'TP.HCM') or 
		(n.PHAI = N'Nữ' and n.DIACHI = N'Hà Nội')
--Câu 4: Cho biết mã người quãn lý của nhân viên Nguyễn Kim Anh
select *
from NHANVIEN n
where n.HOTEN = N'Nguyễn Kim Anh'

--Câu 5: Tìm mã, họ tên những nhân viên làm phòng quản trị
select n.MANV, n.HOTEN
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH and p.TENPH = N'Quản trị'

--Câu 6: Liệt kê danh sách gồm mã, tên và địa chỉ của những nhân viên thuộc Nhân Sự
select n.MANV, n.HOTEN, n.DIACHI
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH and p.TENPH = N'Nhân sự'

--Câu 7: Cho biết ngày sinh, địa chỉ và tên phòng làm việc của nhân viên Trần Lệ Quyên
select n.NGAYSINH, n.DIACHI, p.TENPH
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH and n.HOTEN = N'Trần Lệ Quyên'

--Câu 8: Tìm những nhân viên có lương lớn hơn 15.000.000đ ở phòng nhân sự hoặc lương
--20.000.000đ ở phòng quản trị. Thông tin gồm bảng NHANVIEN
select *
from NHANVIEN n, PHONGBAN p
where (n.MAPH = p.MAPH) and 
	((n.LUONG > 15000000 and p.TENPH = N'Nhân sự') or
		(n.LUONG > 20000000 and p.TENPH = N'Quản trị'))

--Câu 9" Phòng quản trị có bảo nhiêu nhân viên
select p.TENPH, COUNT(n.MANV) AS NhanVien
from NHANVIEN n, PHONGBAN p
where (n.MAPH = p.MAPH) and p.TENPH = N'Quản Trị'
group by p.TENPH

--Câu 10: Tìm tên những nữ nhân viên và tên người thân của họ
select *
from NHANVIEN n, THANNHAN tn
where n.MANV = tn.MANV and n.PHAI = N'Nữ'
--Câu 11: Với mõi phòng ban liệt kê tên phòng ban và lương trung bình của nhân viên làm việc trong phòng ban đó
select p.TENPH, AVG(n.LUONG) as TbLuong
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH
group by p.TENPH
--Câu 12: Cho biết danh sách nhân viên ko làm quản lý
select *
from NHANVIEN n
where n.MANQL is NULL

--Câu 13: Cho biết danh sách nhân viên làm quản lý
select *
from NHANVIEN n
where n.MANQL is not NULL
--Câu 14: Cho biết danh sách những nhân viên không có thân nhân
select *
from NHANVIEN n
where MANV not in (SELECT MANV
					from THANNHAN
					where MANV is not null)

--Câu 15: Cho biết mã và họ tên có lương thấp nhất
--C1
select *
from NHANVIEN n
where LUONG = (select min(LUONG)
				from NHANVIEN)
--C2
select top 1 with ties *
from NHANVIEN n
order by n.LUONG
--Câu 16: Cho biết mã và họ tên nhân viên có lương cao nhất Nhân Sự
--C1
select  *
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH and p.TENPH = N'Nhân sự' and
	LUONG = (select max(LUONG) from NHANVIEN)
--C2
select top 1 with ties *
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH and p.TENPH = N'Nhân sự'
order by n.LUONG desc

--Câu 17: Cho biết tên những đề án có ít nhất 2 nhân viên tham gia
select TENDA, COUNT(pc.MANV) as NhanVien
from DEAN da,PHANCONG pc
where da.MADA = pc.MADA
group by TENDA
having Count(*) >= 2
--Câu 18: Những nhân viên nào tham gia cả hai đề án DA003 và DA004
select *
from DEAN d, PHANCONG pc
where d.MADA = pc.MADA and d.MADA = 'DA003'
union
select *
from DEAN d, PHANCONG pc
where d.MADA = pc.MADA and d.MADA = 'DA001'
--Câu 19: Những nhân viên có lương lớn hơn lương cao nhất các nhân viên phòng Quản Trị
select *
from NHANVIEN 
where LUONG > (select max(LUONG)
				from NHANVIEN n, PHONGBAN p 
				where n.MAPH = p.MAPH and p.TENPH = N'Quản trị')
--Câu 20: Phòng ban nào có số nhân viên nhiều hơn số nhân viên của phòng Kế Hoạch
select p.TENPH, COUNT(n.MANV) as SoNhanVien
from NHANVIEN n, PHONGBAN p
where n.MAPH = p.MAPH
group by p.TENPH
having COUNT(n.MANV) > (select COUNT(n.MANV)
						from NHANVIEN n, PHONGBAN p
						where n.MAPH = p.MAPH and p.TENPH = N'Kế hoạch')
--Câu 21: Liệt kê ba nhân iên có mức lương cao nhất
select top 3 with ties *
from NHANVIEN n
order by n.LUONG desc

--Câu 22: Cập nhập tăng 10% lương cho những nhân viên đã từng tham gia ít nhất 2 đề án
update NHANVIEN
set LUONG = LUONG * 1.1
where MANV in (select MANV
				from PHANCONG
				group by MANV
				having COUNT(*) >= 2)
select * from NHANVIEN

--Câu 23: Cho biết mã và họ tên những nhân viên tham gia tất cả các đề án
select n.MANV, HOTEN
from DEAN d, PHANCONG pc, NHANVIEN n
where d.MADA = pc.MADA and pc.MANV = n.MANV
--Câu 24: Có bao nhiêu đề án bắt đầu từ 01/01/2016
select *
from DEAN d
where d.NGAYBD = '01/01/2016'
--Câu 25: Tầng 1 nhà A có bao nhiêu phòng ban
select DIADIEM, COUNT(MAPH) as SoLuongPhongBan
from PHONGBAN
where DIADIEM = N'Tầng 1 nhà A'
group by DIADIEM
--Câu 26: Cho biết danh sách những nhân viên làm quản lý và số lượng nhân thuộc nhân viên đó quản lý
select ql.MANV, ql.HOTEN, COUNT(n.MANV) as SoLuong
from NHANVIEN n, NHANVIEN ql
where n.MANQL = ql.MANV
group by ql.MANV, ql.HOTEN
--Câu 27: Cho biết danh sách nhân viên quản lý quản lý từ 2 nhân viên trở lên
select ql.MANV, ql.HOTEN, COUNT(n.MANV) as SoLuong
from NHANVIEN n, NHANVIEN ql
where n.MANQL = ql.MANV
group by ql.MANV, ql.HOTEN
having COUNT(*) >= 2