


--创建数据库
CREATE DATABASE shop;

--创建数据表
CREATE TABLE product (
	CHAR(4)        	,
	VARCHAR(100)	,
	INTEGER DEFAULT 0 ,
	DATE		,
PRIMARY KEY ()); 





--删除数据表
DROP TABLE __;

--删除表内容
TRUNCATE TABLE __;

--数据表中添加/删除列（在sql终端输出效果为行，可以理解为每一个feature在矩阵中为列向量）
ALTER TABLE __  ADD  COLUMN __;
		DROP






-- 更新数据
UPDATE product
   SET sale_price = sale_price * 10,
       purchase_price = purchase_price / 2
WHERE product_type = '厨房用具';  

--插入数据
INSERT INTO 表名 VALUES();
--例子
INSERT INTO product VALUES('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11'); 





