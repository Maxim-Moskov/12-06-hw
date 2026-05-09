-- Создаём пользователя для репликации с master-1 на master-2
CREATE USER 'repl_1'@'%' IDENTIFIED WITH mysql_native_password BY 'pass';
GRANT REPLICATION SLAVE ON *.* TO 'repl_1'@'%';
FLUSH PRIVILEGES;

-- Подписываемся на изменения с master-2
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='master-2',
  SOURCE_USER='repl_2',
  SOURCE_PASSWORD='pass',
  GET_SOURCE_PUBLIC_KEY=1;

START REPLICA;
