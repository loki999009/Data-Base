[andrey_sadovoy]
--задания ко 2 уроку
CREATE DATABASE IF NOT EXISTS example;
USE example;
CREATE TABLE IF NOT EXISTS user(id INT (128), name VARCHAR (128));

CREATE DATABASE IF NOT EXISTS simple;

/*

команды в терминале:
mysqldump example > example.sql - дамп example
mysql simple < example.sql - развертывание дампа


mysqldump --where="1 limit 100" mysql help_keyword > table_help_keyword.sql - дамп по параметрам (изтаблицы
help_keyword создаю дамп с ограничением 100 строк
*/