CREATE DATABASE tpch;

DROP TABLE IF EXISTS PART CASCADE;
CREATE TABLE PART ( P_PARTKEY INTEGER PRIMARY KEY,
 P_NAME VARCHAR(55),
 P_MFGR CHAR(25),
 P_BRAND CHAR(10),
 P_TYPE VARCHAR(25),
 P_SIZE INTEGER,
 P_CONTAINER CHAR(10),
 P_RETAILPRICE FLOAT,
 P_COMMENT VARCHAR(23)
);

DROP TABLE IF EXISTS SUPPLIER CASCADE;
CREATE TABLE SUPPLIER (
 S_SUPPKEY Integer PRIMARY KEY,
 S_NAME CHAR(25),
 S_ADDRESS VARCHAR(40),
 S_NATIONKEY INTEGER NOT NULL, -- references N_NATIONKEY
 S_PHONE CHAR(15),
 S_ACCTBAL FLOAT,
 S_COMMENT VARCHAR(101)
);

DROP TABLE IF EXISTS PARTSUPP CASCADE;
CREATE TABLE PARTSUPP (
 PS_PARTKEY INTEGER NOT NULL, -- references P_PARTKEY
 PS_SUPPKEY INTEGER NOT NULL, -- references S_SUPPKEY
 PS_AVAILQTY INTEGER,
 PS_SUPPLYCOST FLOAT,
 PS_COMMENT VARCHAR(199),
 PRIMARY KEY (PS_PARTKEY, PS_SUPPKEY)
);

DROP TABLE IF EXISTS CUSTOMER CASCADE;
CREATE TABLE CUSTOMER (
 C_CUSTKEY Integer PRIMARY KEY,
 C_NAME VARCHAR(25),
 C_ADDRESS VARCHAR(40),
 C_NATIONKEY INTEGER NOT NULL, -- references N_NATIONKEY
 C_PHONE CHAR(15),
 C_ACCTBAL FLOAT,
 C_MKTSEGMENT CHAR(10),
 C_COMMENT VARCHAR(117)
);

DROP TABLE IF EXISTS ORDERS CASCADE;
CREATE TABLE ORDERS (
 O_ORDERKEY Integer PRIMARY KEY,
 O_CUSTKEY INTEGER NOT NULL, -- references C_CUSTKEY
 O_ORDERSTATUS CHAR(1),
 O_TOTALPRICE FLOAT,
 O_ORDERDATE VARCHAR(20),
 O_ORDERPRIORITY CHAR(15),
 O_CLERK CHAR(15),
 O_SHIPPRIORITY INTEGER,
 O_COMMENT VARCHAR(79)
);

DROP TABLE IF EXISTS LINEITEM CASCADE;
CREATE TABLE LINEITEM (
 L_ORDERKEY INTEGER NOT NULL, -- references O_ORDERKEY
 L_PARTKEY INTEGER NOT NULL, -- references P_PARTKEY (compound fk to PARTSUPP)
 L_SUPPKEY INTEGER NOT NULL, -- references S_SUPPKEY (compound fk to PARTSUPP)
 L_LINENUMBER INTEGER,
 L_QUANTITY FLOAT,
 L_EXTENDEDPRICE FLOAT,
 L_DISCOUNT FLOAT,
 L_TAX FLOAT,
 L_RETURNFLAG CHAR(1),
 L_LINESTATUS CHAR(1),
 L_SHIPDATE VARCHAR(20),
 L_COMMITDATE VARCHAR(20),
 L_RECEIPTDATE VARCHAR(20),
 L_SHIPINSTRUCT CHAR(25),
 L_SHIPMODE CHAR(10),
 L_COMMENT VARCHAR(44)
);

DROP TABLE IF EXISTS NATION CASCADE;
CREATE TABLE NATION (
 N_NATIONKEY Integer PRIMARY KEY,
 N_NAME CHAR(25),
 N_REGIONKEY INTEGER NOT NULL,  -- references R_REGIONKEY
 N_COMMENT VARCHAR(152)
);

DROP TABLE IF EXISTS REGION CASCADE;
CREATE TABLE REGION (
 R_REGIONKEY Integer PRIMARY KEY,
 R_NAME CHAR(25),
 R_COMMENT VARCHAR(152)
);