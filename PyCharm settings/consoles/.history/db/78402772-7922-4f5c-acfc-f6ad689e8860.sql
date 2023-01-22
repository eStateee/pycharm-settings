select full_name from customer inner join "order" on customer.customer_id != "order".customer_id;
;-- -. . -..- - / . -. - .-. -.--
select full_name from customer inner join "order" on customer.customer_id not in "order".customer_id;
;-- -. . -..- - / . -. - .-. -.--
select full_name from customer inner join "order" on customer.customer_id = `order`.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select full_name from customer join `order` where `order`.customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select manager_id from customer join `order` where `order`.customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.manager_id from customer join `order` where `order`.customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name from customer join `order` where `order`.customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name from customer join `order` where `order`.customer_id = customer.customer_id limit  1;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name from customer join `order` where `order`.customer_id not in (1,2,3,4);
;-- -. . -..- - / . -. - .-. -.--
e;
;-- -. . -..- - / . -. - .-. -.--
t;
;-- -. . -..- - / . -. - .-. -.--
select full_name from customer;
;-- -. . -..- - / . -. - .-. -.--
select full_name from customer except select customer_id from "order";
;-- -. . -..- - / . -. - .-. -.--
select customer_id from customer except select customer_id from "order";
;-- -. . -..- - / . -. - .-. -.--
select order_no from "order" where customer_id = 101;
;-- -. . -..- - / . -. - .-. -.--
select order_no from "order" where customer_id = 102;
;-- -. . -..- - / . -. - .-. -.--
select order_no from "order" where customer_id = 3;
;-- -. . -..- - / . -. - .-. -.--
select (customer.full_name,manager.full_name,order.order_no) from  customer join manager join "order";
;-- -. . -..- - / . -. - .-. -.--
select (customer.full_name,manager.full_name) from  customer join manager join `order`;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name,manager.full_name from  customer join manager on customer.city = manager.city;
;-- -. . -..- - / . -. - .-. -.--
select customer.city from customer join  "order" on customer.customer_id = (select "order".customer_id from "order");
;-- -. . -..- - / . -. - .-. -.--
select customer.customer_id from customer join  "order" on customer.customer_id = (select "order".customer_id from "order");
;-- -. . -..- - / . -. - .-. -.--
select customer.city, "order".order_no from customer join "order" on "order".customer_id =customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.city, "order".order_no,manager.city from `order` join "customer" on "order".customer_id =customer.customer_id join manager  on `order`.manager_id = manager.manager_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.city, "order".order_no, manager.city
from `order`
         join "customer" on "order".customer_id = customer.customer_id
         join manager on `order`.manager_id = manager.manager_id
        join manager on customer.city != manager.city;
;-- -. . -..- - / . -. - .-. -.--
select customer.city, "order".order_no, manager.city
from `order`
         join "customer" on "order".customer_id = customer.customer_id
         join manager on `order`.manager_id = manager.manager_id
        join manager on customer.city = manager.city;
;-- -. . -..- - / . -. - .-. -.--
select customer.city, "order".order_no, manager.city
from `order`
         join "customer" on "order".customer_id = customer.customer_id
         join manager on `order`.manager_id = manager.manager_id
        join customer on customer.city = manager.city;
;-- -. . -..- - / . -. - .-. -.--
select customer.city, "order".order_no, manager.city
from `order`
         join "customer" on "order".customer_id = customer.customer_id
         join manager on `order`.manager_id = manager.manager_id
        and manager.city != customer.city;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, "order".order_no, manager.full_name
from `order`
         join "customer" on "order".customer_id = customer.customer_id
         join manager on `order`.manager_id = manager.manager_id
        and manager.city != customer.city;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name from customer;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count(order.order_no) from "order" join customer;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count(order.order_no) from "order" join customer on customer.customer_id = 1;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count(order.order_no) from "order" join customer on order.customer_id = 1;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count(order.order_no) from "order" join customer on `order`.customer_id = 1;
;-- -. . -..- - / . -. - .-. -.--
select count(order.order_no) from "order";
;-- -. . -..- - / . -. - .-. -.--
select count(order_no) from "order";
;-- -. . -..- - / . -. - .-. -.--
select count("order".order_no) from "order";
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count("order".order_no) from "order" join customer;
;-- -. . -..- - / . -. - .-. -.--
select  count("order".order_no)  from "order";
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count("order".order_no) from "order" join customer on "order".customer_id = `order`.order_no;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count("order".order_no) from "order" join customer on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name from "order" join customer on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select count(customer.full_name) from "order" join customer on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count(order.customer_id) from "order" join customer on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count("order".customer_id) from "order" join customer on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count("order".customer_id) from "customer" join "order" on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
select customer.full_name, count("order".customer_id) from "customer" inner join "order" on "order".customer_id = customer.customer_id;
;-- -. . -..- - / . -. - .-. -.--
order;