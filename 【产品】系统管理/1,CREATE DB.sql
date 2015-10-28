--grant all privileges on *.* to root@'%';

--创建数据库
create database if not exists user_admin default charset utf8 collate utf8_bin;

--创建用户
CREATE USER useradmin IDENTIFIED  BY 'useradmin' ;
 
--授权
/*
grant select , insert ,update, delete on *.* to zhouliang@"%" identified by 'useradmin';
grant select , insert ,update, delete on *.* to zhouliang@"127.0.0.1" identified by 'useradmin';
grant select , insert ,update, delete on *.* to zhouliang@"localhost" identified by 'useradmin';

grant create , drop on *.* to zhouliang@"%" identified by 'useradmin';
grant create , drop on *.* to zhouliang@"127.0.0.1" identified by 'useradmin';
grant create , drop on *.* to zhouliang@"localhost" identified by 'useradmin';
*/
grant all privileges on user_admin.* to useradmin@"%" identified  by 'useradmin';
grant all privileges on user_admin.* to useradmin@"127.0.0.1" identified  by 'useradmin';
grant all privileges on user_admin.* to useradmin@"localhost" identified  by 'useradmin';
flush privileges;
