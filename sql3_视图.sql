-- 视图是一个虚拟的表，不同于直接操作数据表，视图是依据SELECT语句来创建的（会在下面具体介绍），
-- 所以操作视图时会根据创建视图的SELECT语句生成一张虚拟表，然后在这张虚拟表上做SQL操作。

-- 即视图是基于真实表的一张虚拟的表，其数据来源均建立在真实表的基础上。



视图作用：
通过定义视图可以将频繁使用的SELECT语句保存以提高效率。
通过定义视图可以使用户看到的数据更加清晰。
通过定义视图可以不对外公开数据表全部字段，增强数据的保密性。
通过定义视图可以降低数据的冗余。


一、视图

-- 1. create
CREATE VIEW <视图名称>(<列名1>,<列名2>,...) AS <SELECT语句>

-- single table view
CREATE VIEW productsum (product_type, cnt_product)
AS
SELECT product_type, COUNT(*)
  FROM product
 GROUP BY product_type ;
 
 
 
-- two tables view
CREATE VIEW view_shop_product(product_type, sale_price, shop_name)
AS
SELECT product_type, sale_price, shop_name
  FROM product,                               --table1
       shop_product                           --table2
 WHERE product.product_id = shop_product.product_id;


-- 2. change structure of the view
ALTER VIEW <视图名> AS <SELECT语句>

ALTER VIEW productSum
    AS
        SELECT product_type, sale_price
          FROM Product
         WHERE regist_date > '2009-09-11';
         
         
         
-- 3.change content of the view
因为视图是一个虚拟表，所以对视图的操作就是对底层基础表的操作，所以在修改时只有满足底层基本表的定义才能成功修改。

对于一个视图来说，如果包含以下结构的任意一种都是不可以被更新的：

  聚合函数 SUM()、MIN()、MAX()、COUNT() 等。
  DISTINCT 关键字。
  GROUP BY 子句。
  HAVING 子句。
  UNION 或 UNION ALL 运算符。
  FROM 子句中包含多个表。
视图归根结底还是从表派生出来的，因此，如果原表可以更新，那么 视图中的数据也可以更新。反之亦然，如果视图发生了改变，而原表没有进行相应更新的话，就无法保证数据的一致性了。

UPDATE productsum
   SET sale_price = '5000'
 WHERE product_type = '办公用品';
 
但是并不推荐这种使用方式。而且我们在创建视图时也尽量使用限制不允许通过视图来修改表


-- 4. delete
DROP VIEW <视图名1> [ , <视图名2> …]

DROP VIEW productSum;








