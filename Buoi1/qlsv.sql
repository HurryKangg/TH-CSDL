/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     18/11/2026 10:29:43                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('GIANGVIEN') and o.name = 'FK_GIANGVIE_KHOA_GV_KHOA')
alter table GIANGVIEN
   drop constraint FK_GIANGVIE_KHOA_GV_KHOA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KETQUA') and o.name = 'FK_KETQUA_LHP_KQ_LOPHOCPH')
alter table KETQUA
   drop constraint FK_KETQUA_LHP_KQ_LOPHOCPH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KETQUA') and o.name = 'FK_KETQUA_SV_KQ_SINHVIEN')
alter table KETQUA
   drop constraint FK_KETQUA_SV_KQ_SINHVIEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOP') and o.name = 'FK_LOP_KHOA_LOP_KHOA')
alter table LOP
   drop constraint FK_LOP_KHOA_LOP_KHOA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOPHOCPHAN') and o.name = 'FK_LOPHOCPH_GV_HP_GIANGVIE')
alter table LOPHOCPHAN
   drop constraint FK_LOPHOCPH_GV_HP_GIANGVIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOPHOCPHAN') and o.name = 'FK_LOPHOCPH_MH_HP_MONHOC')
alter table LOPHOCPHAN
   drop constraint FK_LOPHOCPH_MH_HP_MONHOC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SINHVIEN') and o.name = 'FK_SINHVIEN_LOP_SV_LOP')
alter table SINHVIEN
   drop constraint FK_SINHVIEN_LOP_SV_LOP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THANNHAN') and o.name = 'FK_THANNHAN_SV_TN_SINHVIEN')
alter table THANNHAN
   drop constraint FK_THANNHAN_SV_TN_SINHVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('GIANGVIEN')
            and   name  = 'KHOA_GV_FK'
            and   indid > 0
            and   indid < 255)
   drop index GIANGVIEN.KHOA_GV_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GIANGVIEN')
            and   type = 'U')
   drop table GIANGVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KETQUA')
            and   name  = 'SV_KQ_FK'
            and   indid > 0
            and   indid < 255)
   drop index KETQUA.SV_KQ_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KETQUA')
            and   name  = 'LHP_KQ_FK'
            and   indid > 0
            and   indid < 255)
   drop index KETQUA.LHP_KQ_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KETQUA')
            and   type = 'U')
   drop table KETQUA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHOA')
            and   type = 'U')
   drop table KHOA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOP')
            and   name  = 'KHOA_LOP_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOP.KHOA_LOP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOP')
            and   type = 'U')
   drop table LOP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOPHOCPHAN')
            and   name  = 'MH_HP_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOPHOCPHAN.MH_HP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOPHOCPHAN')
            and   name  = 'GV_HP_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOPHOCPHAN.GV_HP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOPHOCPHAN')
            and   type = 'U')
   drop table LOPHOCPHAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MONHOC')
            and   type = 'U')
   drop table MONHOC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SINHVIEN')
            and   name  = 'LOP_SV_FK'
            and   indid > 0
            and   indid < 255)
   drop index SINHVIEN.LOP_SV_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SINHVIEN')
            and   type = 'U')
   drop table SINHVIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THANNHAN')
            and   name  = 'SV_TN_FK'
            and   indid > 0
            and   indid < 255)
   drop index THANNHAN.SV_TN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THANNHAN')
            and   type = 'U')
   drop table THANNHAN
go

/*==============================================================*/
/* Table: GIANGVIEN                                             */
/*==============================================================*/
create table GIANGVIEN (
   MAGV                 char(10)             not null,
   MAKHOA               char(10)             null,
   TENGV                varchar(50)          null,
   constraint PK_GIANGVIEN primary key (MAGV)
)
go

/*==============================================================*/
/* Index: KHOA_GV_FK                                            */
/*==============================================================*/




create nonclustered index KHOA_GV_FK on GIANGVIEN (MAKHOA ASC)
go

/*==============================================================*/
/* Table: KETQUA                                                */
/*==============================================================*/
create table KETQUA (
   MAGV                 char(10)             not null,
   MAMH                 char(10)             not null,
   MALHP                char(10)             not null,
   MASV                 char(10)             not null,
   DIEMCC               float                null,
   DIEMGK               float                null,
   LANTHI               int                  null,
   DIEMCK               float                null,
   constraint PK_KETQUA primary key (MAGV, MAMH, MALHP, MASV)
)
go

/*==============================================================*/
/* Index: LHP_KQ_FK                                             */
/*==============================================================*/




create nonclustered index LHP_KQ_FK on KETQUA (MAGV ASC,
  MAMH ASC,
  MALHP ASC)
go

/*==============================================================*/
/* Index: SV_KQ_FK                                              */
/*==============================================================*/




create nonclustered index SV_KQ_FK on KETQUA (MASV ASC)
go

/*==============================================================*/
/* Table: KHOA                                                  */
/*==============================================================*/
create table KHOA (
   MAKHOA               char(10)             not null,
   TENKHOA              varchar(50)          null,
   constraint PK_KHOA primary key (MAKHOA)
)
go

/*==============================================================*/
/* Table: LOP                                                   */
/*==============================================================*/
create table LOP (
   MALOP                char(10)             not null,
   MAKHOA               char(10)             null,
   TENLOP               varchar(50)          null,
   SISO                 int                  null,
   constraint PK_LOP primary key (MALOP)
)
go

/*==============================================================*/
/* Index: KHOA_LOP_FK                                           */
/*==============================================================*/




create nonclustered index KHOA_LOP_FK on LOP (MAKHOA ASC)
go

/*==============================================================*/
/* Table: LOPHOCPHAN                                            */
/*==============================================================*/
create table LOPHOCPHAN (
   MAGV                 char(10)             not null,
   MAMH                 char(10)             not null,
   MALHP                char(10)             not null,
   TENLHP               varchar(50)          null,
   HOCKY                int                  null,
   NAMHOC               int                  null,
   constraint PK_LOPHOCPHAN primary key (MAGV, MAMH, MALHP)
)
go

/*==============================================================*/
/* Index: GV_HP_FK                                              */
/*==============================================================*/




create nonclustered index GV_HP_FK on LOPHOCPHAN (MAGV ASC)
go

/*==============================================================*/
/* Index: MH_HP_FK                                              */
/*==============================================================*/




create nonclustered index MH_HP_FK on LOPHOCPHAN (MAMH ASC)
go

/*==============================================================*/
/* Table: MONHOC                                                */
/*==============================================================*/
create table MONHOC (
   MAMH                 char(10)             not null,
   TENMH                varchar(50)          null,
   constraint PK_MONHOC primary key (MAMH)
)
go

/*==============================================================*/
/* Table: SINHVIEN                                              */
/*==============================================================*/
create table SINHVIEN (
   MASV                 char(10)             not null,
   MALOP                char(10)             null,
   HOTENSV              varchar(50)          null,
   NGAYSINH             datetime             null,
   DIACHI               varchar(50)          null,
   constraint PK_SINHVIEN primary key (MASV)
)
go

/*==============================================================*/
/* Index: LOP_SV_FK                                             */
/*==============================================================*/




create nonclustered index LOP_SV_FK on SINHVIEN (MALOP ASC)
go

/*==============================================================*/
/* Table: THANNHAN                                              */
/*==============================================================*/
create table THANNHAN (
   MATN                 char(10)             not null,
   MASV                 char(10)             null,
   HOTENTN              varchar(50)          null,
   GIOITINH             char(10)             null,
   constraint PK_THANNHAN primary key (MATN)
)
go

/*==============================================================*/
/* Index: SV_TN_FK                                              */
/*==============================================================*/




create nonclustered index SV_TN_FK on THANNHAN (MASV ASC)
go

alter table GIANGVIEN
   add constraint FK_GIANGVIE_KHOA_GV_KHOA foreign key (MAKHOA)
      references KHOA (MAKHOA)
go

alter table KETQUA
   add constraint FK_KETQUA_LHP_KQ_LOPHOCPH foreign key (MAGV, MAMH, MALHP)
      references LOPHOCPHAN (MAGV, MAMH, MALHP)
go

alter table KETQUA
   add constraint FK_KETQUA_SV_KQ_SINHVIEN foreign key (MASV)
      references SINHVIEN (MASV)
go

alter table LOP
   add constraint FK_LOP_KHOA_LOP_KHOA foreign key (MAKHOA)
      references KHOA (MAKHOA)
go

alter table LOPHOCPHAN
   add constraint FK_LOPHOCPH_GV_HP_GIANGVIE foreign key (MAGV)
      references GIANGVIEN (MAGV)
go

alter table LOPHOCPHAN
   add constraint FK_LOPHOCPH_MH_HP_MONHOC foreign key (MAMH)
      references MONHOC (MAMH)
go

alter table SINHVIEN
   add constraint FK_SINHVIEN_LOP_SV_LOP foreign key (MALOP)
      references LOP (MALOP)
go

alter table THANNHAN
   add constraint FK_THANNHAN_SV_TN_SINHVIEN foreign key (MASV)
      references SINHVIEN (MASV)
go

