-- goit-rdb-hw-07
-- Домашнє завдання до Теми 7
-- Додаткові вбудовані SQL функції. Робота з часом
-- MySQL 8.x

USE goit_rdb_hw_03;

-- =========================================================
-- TASK 1
-- Для orders.date витягнути рік, місяць і день
-- =========================================================

SELECT
    id,
    date,
    YEAR(STR_TO_DATE(date, '%Y-%m-%d')) AS year,
    MONTH(STR_TO_DATE(date, '%Y-%m-%d')) AS month,
    DAY(STR_TO_DATE(date, '%Y-%m-%d')) AS day
FROM orders;


-- =========================================================
-- TASK 2
-- Додати один день до orders.date
-- DATE_FORMAT використано, щоб результат був явно у форматі YYYY-MM-DD
-- =========================================================

SELECT
    id,
    date,
    DATE_FORMAT(
        DATE_ADD(CAST(date AS DATE), INTERVAL 1 DAY),
        '%Y-%m-%d'
    ) AS date_plus_one_day
FROM orders;


-- =========================================================
-- TASK 3
-- Показати UNIX timestamp (кількість секунд від початку відліку)
-- для orders.date
-- =========================================================

SELECT
    id,
    date,
    UNIX_TIMESTAMP(STR_TO_DATE(date, '%Y-%m-%d')) AS unix_timestamp
FROM orders;


-- =========================================================
-- TASK 4
-- Порахувати кількість замовлень у заданому діапазоні дат
-- =========================================================

SELECT
    COUNT(*) AS orders_count
FROM orders
WHERE STR_TO_DATE(date, '%Y-%m-%d')
      BETWEEN '1996-07-10 00:00:00'
          AND '1996-10-08 00:00:00';


-- =========================================================
-- TASK 5
-- Створити JSON-об'єкт {"id": ..., "date": ...}
-- =========================================================

SELECT
    id,
    date,
    JSON_OBJECT(
        'id', id,
        'date', date
    ) AS json_object
FROM orders;
