# Лабораторна робота №10
## Тема: Система управління зоопарком на SQL
____________

### Виконав: Білоус Марк Олександрович ПД-31

____________


### Що потрібно мати в лабораторній роботі?

Мета: Розробити всеосяжну SQL базу даних для зоопарку, в якому знаходяться різні види тварин, їх доглядачі, щоденний графік годівлі та журнал відвідувачів.

### Навчальні Цілі:
Завдання:

Таблиці:

Тварини:

animal_id (Основний ключ, Автоінкремент)
name (ім'я)
species (вид)
date_of_birth (дата народження)
habitat (середовище існування)

Доглядачі:

caretaker_id (Основний ключ, Автоінкремент)
name (ім'я)
specialization (спеціалізація, наприклад: рептилії, ссавці, птахи)

Графік годівлі:

feed_id (Основний ключ, Автоінкремент)
animal_id (Зовнішній ключ)
caretaker_id (Зовнішній ключ)
feed_time (час годівлі)
feed_type (тип корму)

Відвідувачі:

visitor_id (Основний ключ, Автоінкремент)
name (ім'я)
visit_date (дата візиту)

Тварини, яких відвідали:

visit_id (Основний ключ, Автоінкремент)
visitor_id (Зовнішній ключ)
animal_id (Зовнішній ключ)
Завдання:

Створити схему для вказаних вище таблиць.

Вставити принаймні 5 записів у кожну таблицю.

Написати SQL-запити для наступного:

a. Отримати список всіх тварин та їх відповідних доглядачів.

b. Визначити, який вид тварин найчастіше відвідується відвідувачами.

c. Визначити, який доглядач має найбільш різноманітну спеціалізацію, тобто він доглядає за найбільшою кількістю видів.

d. Виявити дні, коли зоопарк відвідали більше ніж 10 відвідувачів.

e. Створити звіт про графік годівлі, який включає ім'я тварини, ім'я доглядача, час годівлі та тип корму, відсортовані за часом годівлі.

Робота повинна бути збережена у форматі example.sql (назва не повинна бути 'example')

-------

## Етапи виконання для проекту з API

### Перший етап

Створення sql таблиці по  завданню, створював через PhpMyAdmin.

### Другий етап

------

Написання запитів до таблиці:

--------

а. 
SELECT Animals.name AS animal_name, Caretakers.name AS caretaker_name
FROM Animals
JOIN FeedingSchedule ON Animals.animal_id = FeedingSchedule.animal_id
JOIN Caretakers ON FeedingSchedule.caretaker_id = Caretakers.caretaker_id;

------------

b. 
SELECT Animals.species, COUNT(VisitedAnimals.animal_id) AS visit_count
FROM Animals
JOIN VisitedAnimals ON Animals.animal_id = VisitedAnimals.animal_id
GROUP BY Animals.species
ORDER BY visit_count DESC
LIMIT 1;

----------

c. 
SELECT Caretakers.name, COUNT(DISTINCT FeedingSchedule.animal_id) AS specialization_count
FROM Caretakers
JOIN FeedingSchedule ON Caretakers.caretaker_id = FeedingSchedule.caretaker_id
GROUP BY Caretakers.caretaker_id
ORDER BY specialization_count DESC
LIMIT 1;

--------

d.
SELECT visit_date
FROM Visitors
GROUP BY visit_date
HAVING COUNT(visitor_id) > 10;

--------

e. 
SELECT Animals.name AS animal_name, Caretakers.name AS caretaker_name, FeedingSchedule.feed_time, FeedingSchedule.feed_type
FROM FeedingSchedule
JOIN Animals ON FeedingSchedule.animal_id = Animals.animal_id
JOIN Caretakers ON FeedingSchedule.caretaker_id = Caretakers.caretaker_id
ORDER BY FeedingSchedule.feed_time;

---------

### Третій етап

Експорт бази даних, створення репозиторію в github, завантаження файлу на платформу.
Оформлення звіту.
