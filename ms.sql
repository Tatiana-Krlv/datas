-- Удаление и создание базы данных
IF DB_ID('RGR') IS NOT NULL
BEGIN
    ALTER DATABASE RGR SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RGR;
END
CREATE DATABASE RGR;
GO

USE RGR;
GO

-- Удаление таблиц
IF OBJECT_ID('dbo.department', 'U') IS NOT NULL DROP TABLE dbo.department;
IF OBJECT_ID('dbo.positions', 'U') IS NOT NULL DROP TABLE dbo.positions;
IF OBJECT_ID('dbo.project', 'U') IS NOT NULL DROP TABLE dbo.project;
IF OBJECT_ID('dbo.employe_programs', 'U') IS NOT NULL DROP TABLE dbo.employe_programs;
IF OBJECT_ID('dbo.employe', 'U') IS NOT NULL DROP TABLE dbo.employe;
GO

-- Создание таблиц
CREATE TABLE department (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(200) NOT NULL
);

CREATE TABLE employe (
    id INT IDENTITY(1,1) PRIMARY KEY,
    department_id INT NOT NULL,
    position_id INT NOT NULL,
    name NVARCHAR(150) NOT NULL,
    male BIT NOT NULL,
    age SMALLINT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE positions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    position_name NVARCHAR(100) NOT NULL
);

CREATE TABLE project (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employe_id INT NOT NULL,
    department_id INT NOT NULL,
    project_date DATE NOT NULL,
    project_title NVARCHAR(200) NOT NULL DEFAULT 'unknown_project',
    project_description NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (employe_id) REFERENCES employe(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employe_programs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employe_id INT NOT NULL,
    program_name NVARCHAR(100) NOT NULL,
    login NVARCHAR(75) NOT NULL DEFAULT '-',
    password NVARCHAR(20) NOT NULL DEFAULT '-',
    access BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (employe_id) REFERENCES employe(id)
);

-- Внесение данных
INSERT INTO department(name) 
VALUES  (N'Департамент по управлению персоналом'), (N'Департамент по контролю качества'), 
        (N'Департамент по маркетингу и рекламе'), (N'Департамент по информационным технологиям'), 
        (N'Департамент по финансам и бухгалтерии'), (N'Департамент по корпоративным коммуникациям'), 
        (N'Департамент по исследованиям и разработкам ИС'), (N'Департамент по юридическим вопросам'), 
        (N'Департамент по закупкам и снабжению'), (N'Департамент по логистике');

INSERT INTO positions(position_name) 
VALUES  (N'Менеджер отдела продаж'), (N'Менеджер по работе с клиентами'), 
        (N'Директор департамента по управлению персоналом'), (N'Креативный менеджер технологий'), 
        (N'Специалист технической безопасности'), (N'Специалист технической поддержки клиентов'), 
        (N'Уборщик'), (N'Креативный директор'), 
        (N'Директор корпоративной коммуникации'), (N'Бухгалтер');

INSERT INTO employe(department_id, position_id, name, male, age)
VALUES  (6, 1, N'Осипова Елена Михайловна', 1, 38),
        (9, 2, N'Данилова Фатима Ярославовна', 1, 21),
        (2, 3, N'Панина Софья Игоревна', 1, 30),
        (3, 4, N'Еремеев Дмитрий Романович', 1, 42),
        (8, 5, N'Беляков Никита Даниилович', 1, 53),
        (9, 6, N'Кондратьева Екатерина Артёмовна', 0, 44),
        (7, 7, N'Гаврилова Мия Александровна', 0, 22),
        (6, 8, N'Дмитриева Татьяна Кирилловна', 0, 49),
        (9, 9, N'Прокофьева Ясмина Егоровна', 0, 50),
        (4, 10, N'Ларионова Александра Львовна', 0, 46);

INSERT INTO project(employe_id, department_id, project_date, project_title, project_description)
VALUES  (1, 2, '2023-03-11', N'Внедрение технологии 5G', N'Создание инфраструктуры нового поколения сетей для обеспечения более высокой скорости передачи данных и улучшения качества связи.'),
        (1, 2, '2018-08-28', N'Развитие системы кабельного телевидения', N'Улучшение качества телевизионного сигнала, добавление новых каналов и развитие технологий интерактивного телевидения'),
        (1, 2, '2023-08-04', N'Расширение сети интернета в сельской местности', N'Подключение к сети интернета домов и организаций, находящихся в отдаленных и малонаселенных районах.'),
        (8, 6, '2018-12-24', N'Скоростной интернет для городских районов', N'Цель проекта - обеспечить высокоскоростной интернет в малозаселенных районах города, где сейчас доступ к современным технологиям связи ограничен.'),
        (3, 2, '2021-03-27', N'Развитие облачных сервисов для бизнес-клиентов', N'Предоставление облачных сервисов для предприятий и увеличение функционала облачных хранилищ данных.'),
        (3, 2, '2023-01-07', N'Обновление сетевого оборудования', N'Замена устаревшего оборудования на современное и более производительное для улучшения качества предоставляемых услуг.'),
        (3, 2, '2020-01-14', N'Улучшение техподдержки и клиентского обслуживания', N'Повышение качества обслуживания клиентов, ускорение процессов решения проблем и внедрение новых технологий в области технической поддержки.'),
        (8, 6, '2018-01-09', N'Внедрение оптических волоконных сетей', N'Создание инфраструктуры на основе оптических волоконных сетей для улучшения качества интернет-соединения и повышения скорости передачи данных.'),
        (8, 6, '2022-02-22', N'Внедрение сетей Интернета вещей', N'Создание инфраструктуры для подключения умных устройств и внедрения интернета вещей для домашнего и коммерческого использования.'),
        (8, 6, '2018-07-07', N'Увеличение доступности Wi-Fi в городских общественных местах', N'Расширение зоны покрытия беспроводного интернета в парках, библиотеках, торговых центрах и других общественных местах.');

INSERT INTO employe_programs(employe_id, program_name, login, password, access)
VALUES  (1, N'G Suite', N'tiger7', N'H2t@5Y8z', 1),
        (1, N'Microsoft Office Word', N'-', N'-', 1),
        (1, N'Slack', N'jumper', N'L!p3s@9X', 1),
        (3, N'Trello', N'123cat', N'N6k#p2Ft', 0),
        (3, N'Zoom', N'4rhino', N'G8j@4L1r', 1),
        (3, N'SQL-admin', N'7guitar', N'B@5r7P!z', 1),
        (3, N'Adobe Creative Cloud', N'blaze6', N'K3t@9L4z', 1),
        (3, N'FredOn Analys', N'swift2', N'H6b!p2Tl', 1),
        (8, N'SAP Business One', N'lunar7', N'J5g@2H8k', 1),
        (8, N'VCK Company Account Editor', N'biker9', N'G9t#4Y6w', 1);

-- Создание триггеров
-- INSERT
IF OBJECT_ID ('project_insert', 'TR') IS NOT NULL DROP TRIGGER project_insert;
GO
CREATE TRIGGER project_insert 
ON project
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE employe_id NOT IN (SELECT id FROM employe))
    BEGIN
        RAISERROR ('Cannot insert this employe_id. Such employe was not found.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM inserted WHERE department_id != (SELECT department_id FROM employe WHERE id = inserted.employe_id))
    BEGIN
        RAISERROR ('This employe does not belong to this department', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO project (employe_id, department_id, project_date, project_title, project_description)
    SELECT employe_id, department_id, project_date, project_title, project_description
    FROM inserted;
END;
GO

IF OBJECT_ID ('employe_insert', 'TR') IS NOT NULL DROP TRIGGER employe_insert;
GO
CREATE TRIGGER employe_insert 
ON employe
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE department_id NOT IN (SELECT id FROM department))
    BEGIN
        RAISERROR ('No such department_id.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM inserted WHERE position_id NOT IN (SELECT id FROM positions))
    BEGIN
        RAISERROR ('No such position_id.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO employe (department_id, position_id, name, male, age)
    SELECT department_id, position_id, name, male, age
    FROM inserted;
END;
GO

IF OBJECT_ID ('employe_programs_insert', 'TR') IS NOT NULL DROP TRIGGER employe_programs_insert;
GO
CREATE TRIGGER employe_programs_insert 
ON employe_programs
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE employe_id NOT IN (SELECT id FROM employe))
    BEGIN
        RAISERROR ('No such employe_id.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    INSERT INTO employe_programs (employe_id, program_name, login, password, access)
    SELECT employe_id, program_name, login, password, access
    FROM inserted;
END;
GO

-- UPDATE
IF OBJECT_ID ('project_update', 'TR') IS NOT NULL DROP TRIGGER project_update;
GO
CREATE TRIGGER project_update 
ON project
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE employe_id NOT IN (SELECT id FROM employe))
    BEGIN
        RAISERROR ('Cannot update this employe_id. Such employe was not found.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM inserted WHERE department_id != (SELECT department_id FROM employe WHERE id = inserted.employe_id))
    BEGIN
        RAISERROR ('This employe does not belong to this department', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    UPDATE project
    SET employe_id = inserted.employe_id,
        department_id = inserted.department_id,
        project_date = inserted.project_date,
        project_title = inserted.project_title,
        project_description = inserted.project_description
    FROM inserted
    WHERE project.id = inserted.id;
END;
GO

IF OBJECT_ID ('employe_update', 'TR') IS NOT NULL DROP TRIGGER employe_update;
GO
CREATE TRIGGER employe_update 
ON employe
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE department_id NOT IN (SELECT id FROM department))
    BEGIN
        RAISERROR ('No such department_id.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM inserted WHERE position_id NOT IN (SELECT id FROM positions))
    BEGIN
        RAISERROR ('No such position_id.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    UPDATE employe
    SET department_id = inserted.department_id,
        position_id = inserted.position_id,
        name = inserted.name,
        male = inserted.male,
        age = inserted.age
    FROM inserted
    WHERE employe.id = inserted.id;
END;
GO

IF OBJECT_ID ('employe_programs_update', 'TR') IS NOT NULL DROP TRIGGER employe_programs_update;
GO
CREATE TRIGGER employe_programs_update 
ON employe_programs
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE employe_id NOT IN (SELECT id FROM employe))
    BEGIN
        RAISERROR ('No such employe_id.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    UPDATE employe_programs
    SET employe_id = inserted.employe_id,
        program_name = inserted.program_name,
        login = inserted.login,
        password = inserted.password,
        access = inserted.access
    FROM inserted
    WHERE employe_programs.id = inserted.id;
END;
GO

-- DELETE
IF OBJECT_ID ('employe_delete', 'TR') IS NOT NULL DROP TRIGGER employe_delete;
GO
CREATE TRIGGER employe_delete 
ON employe
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM employe_programs WHERE employe_programs.employe_id = deleted.id)
    BEGIN
        RAISERROR ('You cannot delete this employe. Because it is in the table employe_programs. Remove it from employe_programs table first.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM project WHERE project.employe_id = deleted.id)
    BEGIN
        RAISERROR ('You cannot delete this employe. Because it is in the table project. Remove it from project table first.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    DELETE FROM employe
    WHERE id = deleted.id;
END;
GO

IF OBJECT_ID ('department_delete', 'TR') IS NOT NULL DROP TRIGGER department_delete;
GO
CREATE TRIGGER department_delete 
ON department
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM employe WHERE employe.department_id = deleted.id)
    BEGIN
        RAISERROR ('You cannot delete this department. Because some employees are attached to him.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    DELETE FROM department
    WHERE id = deleted.id;
END;
GO

IF OBJECT_ID ('positions_delete', 'TR') IS NOT NULL DROP TRIGGER positions_delete;
GO
CREATE TRIGGER positions_delete 
ON positions
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM employe WHERE employe.position_id = deleted.id)
    BEGIN
        RAISERROR ('You cannot delete this position. Because some employees are attached to him.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    DELETE FROM positions
    WHERE id = deleted.id;
END;
GO
