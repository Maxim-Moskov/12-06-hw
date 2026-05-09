-- Указываем мастер как источник репликации
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='mysql_master',
  SOURCE_USER='repl',
  SOURCE_PASSWORD='slavepass',
  GET_SOURCE_PUBLIC_KEY=1;
-- Запускаем процесс репликации
START REPLICA;
