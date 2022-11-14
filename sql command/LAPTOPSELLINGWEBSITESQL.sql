CREATE TABLE THONGTINLAPTOP
(	
	MALAPTOP VARCHAR(20) NOT NULL,
	TENLAPTOP VARCHAR(50),
	HANG VARCHAR(20),
	GIABAN BIGINT,
	SERIES VARCHAR(20),
	MAU VARCHAR(20),
	CPU	VARCHAR(50),
	VGA VARCHAR(50), 
	RAM CHAR(10),
	KICHTHUOCMANHINH VARCHAR(10),
	OCUNG VARCHAR(10),
	BANPHIM VARCHAR(10),
	PIN VARCHAR(50),
	KHOILUONG VARCHAR(10),
	LINKHINH1 VARCHAR(255),
	LINKHINH2 VARCHAR(255),
	LINKHINH3 VARCHAR(255),
	LINKHINH4 VARCHAR(255),
	LINKHINH5 VARCHAR(255)
);

CREATE TABLE KHUYENMAI (
	MAKHUYENMAI VARCHAR(20) NOT NULL,
	MUCKHUYENMAI FLOAT,
	Ngaybatdau date,
	NGAYHETHAN DATE
);

CREATE TABLE GIOHANG (
	MAGIOHANG	VARCHAR(10) NOT NULL,
	ID VARCHAR(10) NOT NULL,
	MAKHUYENMAI VARCHAR(20),
	NGAYXUATGIOHANG DATE,
	TRIGIA BIGINT
);


CREATE TABLE KHOHANG (
	MALAPTOP VARCHAR(20) NOT NULL,
	SLNHAP	INT,
	SLXUAT INT,
	TONKHO INT
);

CREATE TABLE CTGH
(	
	MAGIOHANG VARCHAR(10) NOT NULL,
	MALAPTOP VARCHAR(20) NOT NULL,
	SOLUONG	INT
);



CREATE TABLE ACCOUNT (
	ID CHAR(10) NOT NULL,
	TENKH VARCHAR(50),
	DIACHI VARCHAR(255),
	QUYEN SMALLINT
);


CREATE TABLE USERS (
	ID CHAR(10) NOT NULL,
	USERNAME VARCHAR(50) NOT NULL,
	HO VARCHAR(50),
	TEN VARCHAR(50),
	EMAIL VARCHAR(50),
	SDT VARCHAR(10),
	MATKHAU VARCHAR(50) NOT NULL
);

CREATE TABLE HANGSX (
	TENHANG VARCHAR(20) NOT NULL,
	QUOCGIA VARCHAR(50),
	POSTER VARCHAR(100),
	LOGOVUONG VARCHAR(100),
	LOGONGANG VARCHAR(100),
	SLOGAN VARCHAR(100)
);

CREATE TABLE KHUYENMAISANPHAM (
	MALAPTOP VARCHAR(20),
	PHANTRAMKHUYENMAI FLOAT,
	NGAYBATDAU DATETIME,
	NGAYKETTHUC DATETIME
);


---------------------------------------------START SET KEY------------------------------------------------------
-- SET PRIMARY KEY
ALTER TABLE THONGTINLAPTOP ADD CONSTRAINT MALAPTOP_PK PRIMARY KEY (MALAPTOP);
ALTER TABLE GIOHANG ADD CONSTRAINT GIOHANG_PK PRIMARY KEY (MAGIOHANG);
ALTER TABLE KHUYENMAI ADD CONSTRAINT MAKM_PK1 PRIMARY KEY (MAKHUYENMAI);
ALTER TABLE USERS ADD CONSTRAINT ID_PK PRIMARY KEY (ID);
ALTER TABLE HANGSX ADD CONSTRAINT TENHANG_PK PRIMARY KEY (TENHANG);

-- SET FOREIGN KEY
ALTER TABLE ACCOUNT ADD CONSTRAINT ID_FK FOREIGN KEY (ID) REFERENCES USERS(ID);
ALTER TABLE GIOHANG ADD CONSTRAINT ID_FKKH FOREIGN KEY (ID) REFERENCES ACCOUNT(ID);
ALTER TABLE CTGH ADD CONSTRAINT MALAPTOP_FKTTLT FOREIGN KEY (MALAPTOP) REFERENCES THONGTINLAPTOP(MALAPTOP);
ALTER TABLE KHOHANG ADD CONSTRAINT MALAPTOP_FK_TTLT FOREIGN KEY (MALAPTOP) REFERENCES THONGTINLAPTOP(MALAPTOP);
ALTER TABLE CTGH ADD CONSTRAINT MAGIOHANG_FKGH FOREIGN KEY (MAGIOHANG) REFERENCES GIOHANG(MAGIOHANG);
ALTER TABLE GIOHANG ADD CONSTRAINT MAKHUYENMAI_FKKH FOREIGN KEY (MAKHUYENMAI) REFERENCES KHUYENMAI(MAKHUYENMAI);
ALTER TABLE THONGTINLAPTOP ADD CONSTRAINT TENHANG_FKHSX FOREIGN KEY (HANG) REFERENCES HANGSX(TENHANG);
ALTER TABLE KHUYENMAISANPHAM ADD CONSTRAINT MALAPTOP_FKKMSP FOREIGN KEY (MALAPTOP) REFERENCES THONGTINLAPTOP(MALAPTOP);

GO