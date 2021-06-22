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
  
SELECT name, sex, id, salary FROM table_name WHERE name='MTbaby';
SELECT name, sex, id, salary FROM table_name WHERE name IN ("MTbaby","abboter","小明");
SELECT name, sex, id, salary FROM table_name WHERE name LIKE  '%明%';    
  



二、算术运算符和比较运算符

运算符	含义
=	    和~相等
<>	  和~不相等
>=	  大于等于~
>	    大于~
<=	  小于等于~
<	    小于~




三、逻辑运算符

AND 运算符优先于 OR 运算符

这时真值是除真假之外的第三种值——不确定（UNKNOWN）。一般的逻辑运算并不存在这第三种值。
SQL 之外的语言也基本上只使用真和假这两种真值。与通常的逻辑运算被称为二值逻辑相对，只有 SQL 中的逻辑运算被称为三值逻辑。


四、对表进行聚合查询

COUNT函数的结果根据参数的不同而不同。COUNT(*)会得到包含NULL的数据行数，而COUNT(<列名>)会得到NULL之外的数据行数。
聚合函数会将NULL排除在外。但COUNT(*)例外，并不会排除NULL。
MAX/MIN函数几乎适用于所有数据类型的列。SUM/AVG函数只适用于数值类型的列。
想要计算值的种类时，可以在COUNT函数的参数中使用DISTINCT。
在聚合函数的参数中使用DISTINCT，可以删除重复数据。


-- 计算全部数据的行数（包含NULL）
SELECT COUNT(*)
  FROM product;
-- 计算NULL以外数据的行数,
SELECT COUNT(purchase_price)
  FROM product;
-- 计算销售单价和进货单价的合计值
SELECT SUM(sale_price), SUM(purchase_price) 
  FROM product;
-- 计算销售单价和进货单价的平均值
SELECT AVG(sale_price), AVG(purchase_price)
  FROM product;
-- MAX和MIN也可用于非数值型数据
SELECT MAX(regist_date), MIN(regist_date)
  FROM product;
-- 计算去除重复数据后的数据行数
SELECT COUNT(DISTINCT product_type)
 FROM product;
-- 是否使用DISTINCT时的动作差异（SUM函数）
SELECT SUM(sale_price), SUM(DISTINCT sale_price)
 FROM product;
 
 
 
五、对表进行分组
GROUP BY的子句书写顺序有严格要求，不按要求会导致SQL无法正常执行，目前出现过的子句书写****顺序为：
1**.**SELECT → 2. FROM → 3. WHERE → 4. GROUP BY

-- 按照商品种类统计数据行数
SELECT product_type, COUNT(*)
  FROM product
 GROUP BY product_type;


六、为聚合结果指定条件
 用HAVING得到特定分组
 HAVING子句用于对分组进行过滤，可以使用数字、聚合函数和GROUP BY中指定的列名（聚合键）。
 
-- 数字
SELECT product_type, COUNT(*)
  FROM product
 GROUP BY product_type
HAVING COUNT(*) = 2;/HAVING product_type = '衣服'

七、对查询结果进行排序
SELECT <列名1>, <列名2>, <列名3>, ……
  FROM <表名>
 ORDER BY <排序基准列1>, <排序基准列2>, ……
 
 -- 降序排列
SELECT product_id, product_name, sale_price, purchase_price
  FROM product
 ORDER BY sale_price DESC;
-- 多个排序键
SELECT product_id, product_name, sale_price, purchase_price
  FROM product
 ORDER BY sale_price, product_id;
-- 当用于排序的列名中含有NULL时，NULL会在开头或末尾进行汇总。
SELECT product_id, product_name, sale_price, purchase_price
  FROM product
 ORDER BY purchase_price;
 
前文讲GROUP BY中提到，GROUP BY 子句中不能使用SELECT 子句中定义的别名，但是在 ORDER BY 子句中却可以使用别名。为什么在GROUP BY中不可以而在ORDER BY中可以呢？
这是因为SQL在使用 HAVING 子句时 SELECT 语句的执行****顺序为：
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
