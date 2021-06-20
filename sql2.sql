一、SELECT语句基础


SELECT <列名>, ……
  FROM <表名>
 WHERE <条件表达式>;
 
 
 
 SELECT product_name
  FROM product
 WHERE product_type = '衣服';
 
 
 
 -- 想要查询出全部列时，可以使用代表所有列的星号（*）。
SELECT *
  FROM <表名>;
-- SQL语句可以使用AS关键字为列设定别名（用中文时需要双引号（“”））。
SELECT product_id     AS id,
       product_name   AS name,
       purchase_price AS "进货单价"
  FROM product;
-- 使用DISTINCT删除product_type列中重复的数据
SELECT DISTINCT product_type
  FROM product;
  
  
  
  
  
