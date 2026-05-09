-- Создаём пользователя для репликации с master-2 на master-1
CREATE USER 'repl_2'@'%' IDENTIFIED WITH mysql_native_password BY 'pass';
GRANT REPLICATION SLAVE ON *.* TO 'repl_2'@'%';
FLUSH PRIVILEGES;

-- Подписываемся на изменения с master-1
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='master-1',
  SOURCE_USER='repl_1',
  SOURCE_PASSWORD='pass',
  GET_SOURCE_PUBLIC_KEY=1;

START REPLICA;
