-- Создаём пользователя для репликации
CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY 'slavepass';
-- Выдаём права для репликации
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
-- Применяем изменения
FLUSH PRIVILEGES;
