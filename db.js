// Подключение к базе данных
use RGR;

// Удаление базы данных, если она существует
db.dropDatabase();

// Создание коллекций
db.createCollection("department");
db.createCollection("positions");
db.createCollection("employe");
db.createCollection("project");
db.createCollection("employe_programs");

// Вставка данных в коллекции
db.department.insertMany([
    {name: "Департамент по управлению персоналом"},
    {name: "Департамент по контролю качества"},
    {name: "Департамент по маркетингу и рекламе"},
    {name: "Департамент по информационным технологиям"},
    {name: "Департамент по финансам и бухгалтерии"},
    {name: "Департамент по корпоративным коммуникациям"},
    {name: "Департамент по исследованиям и разработкам ИС"},
    {name: "Департамент по юридическим вопросам"},
    {name: "Департамент по закупкам и снабжению"},
    {name: "Департамент по логистике"}
]);

db.positions.insertMany([
    {position_name: "Менеджер отдела продаж"},
    {position_name: "Менеджер по работе с клиентами"},
    {position_name: "Директор департамента по управлению персоналом"},
    {position_name: "Креативный менеджер технологий"},
    {position_name: "Специалист технической безопасности"},
    {position_name: "Специалист технической поддержки клиентов"},
    {position_name: "Уборщик"},
    {position_name: "Креативный директор"},
    {position_name: "Директор корпоративной коммуникации"},
    {position_name: "Бухгалтер"}
]);

db.employe.insertMany([
    {department_id: 6, position_id: 1, name: "Осипова Елена Михайловна", male: true, age: 38},
    {department_id: 9, position_id: 2, name: "Данилова Фатима Ярославовна", male: true, age: 21},
    {department_id: 2, position_id: 3, name: "Панина Софья Игоревна", male: true, age: 30},
    {department_id: 3, position_id: 4, name: "Еремеев Дмитрий Романович", male: true, age: 42},
    {department_id: 8, position_id: 5, name: "Беляков Никита Даниилович", male: true, age: 53},
    {department_id: 9, position_id: 6, name: "Кондратьева Екатерина Артёмовна", male: false, age: 44},
    {department_id: 7, position_id: 7, name: "Гаврилова Мия Александровна", male: false, age: 22},
    {department_id: 6, position_id: 8, name: "Дмитриева Татьяна Кирилловна", male: false, age: 49},
    {department_id: 9, position_id: 9, name: "Прокофьева Ясмина Егоровна", male: false, age: 50},
    {department_id: 4, position_id: 10, name: "Ларионова Александра Львовна", male: false, age: 46}
]);

db.project.insertMany([
    {employe_id: 1, department_id: 2, project_date: new Date("2023-03-11"), project_title: "Внедрение технологии 5G", project_description: "Создание инфраструктуры нового поколения сетей для обеспечения более высокой скорости передачи данных и улучшения качества связи."},
    {employe_id: 1, department_id: 2, project_date: new Date("2018-08-28"), project_title: "Развитие системы кабельного телевидения", project_description: "Улучшение качества телевизионного сигнала, добавление новых каналов и развитие технологий интерактивного телевидения"},
    {employe_id: 1, department_id: 2, project_date: new Date("2023-08-04"), project_title: "Расширение сети интернета в сельской местности", project_description: "Подключение к сети интернета домов и организаций, находящихся в отдаленных и малонаселенных районах."},
    {employe_id: 8, department_id: 6, project_date: new Date("2018-12-24"), project_title: "Скоростной интернет для городских районов", project_description: "Цель проекта - обеспечить высокоскоростной интернет в малозаселенных районах города, где сейчас доступ к современным технологиям связи ограничен."},
    {employe_id: 3, department_id: 2, project_date: new Date("2021-03-27"), project_title: "Развитие облачных сервисов для бизнес-клиентов", project_description: "Предоставление облачных сервисов для предприятий и увеличение функционала облачных хранилищ данных."},
    {employe_id: 3, department_id: 2, project_date: new Date("2023-01-07"), project_title: "Обновление сетевого оборудования", project_description: "Замена устаревшего оборудования на современное и более производительное для улучшения качества предоставляемых услуг."},
    {employe_id: 3, department_id: 2, project_date: new Date("2020-01-14"), project_title: "Улучшение техподдержки и клиентского обслуживания", project_description: "Повышение качества обслуживания клиентов, ускорение процессов решения проблем и внедрение новых технологий в области технической поддержки."},
    {employe_id: 8, department_id: 6, project_date: new Date("2018-01-09"), project_title: "Внедрение оптических волоконных сетей", project_description: "Создание инфраструктуры на основе оптических волоконных сетей для улучшения качества интернет-соединения и повышения скорости передачи данных."},
    {employe_id: 8, department_id: 6, project_date: new Date("2022-02-22"), project_title: "Внедрение сетей Интернета вещей", project_description: "Создание инфраструктуры для подключения умных устройств и внедрения интернета вещей для домашнего и коммерческого использования."},
    {employe_id: 8, department_id: 6, project_date: new Date("2018-07-07"), project_title: "Увеличение доступности Wi-Fi в городских общественных местах", project_description: "Расширение зоны покрытия беспроводного интернета в парках, библиотеках, торговых центрах и других общественных местах."}
]);

db.employe_programs.insertMany([
    {employe_id: 1, program_name: "G Suite", login: "tiger7", password: "H2t@5Y8z", access: true},
    {employe_id: 1, program_name: "Microsoft Office Word", login: "-", password: "-", access: true},
    {employe_id: 1, program_name: "Slack", login: "jumper", password: "L!p3s@9X", access: true},
    {employe_id: 3, program_name: "Trello", login: "123cat", password: "N6k#p2Ft", access: false},
    {employe_id: 3, program_name: "Zoom", login: "4rhino", password: "G8j@4L1r", access: true},
    {employe_id: 3, program_name: "SQL-admin", login: "7guitar", password: "B@5r7P!z", access: true},
    {employe_id: 3, program_name: "Adobe Creative Cloud", login: "blaze6", password: "K3t@9L4z", access: true},
    {employe_id: 3, program_name: "FredOn Analys", login: "swift2", password: "H6b!p2Tl", access: true},
    {employe_id: 8, program_name: "SAP Business One", login: "lunar7", password: "J5g@2H8k", access: true},
    {employe_id: 8, program_name: "VCK Company Account Editor", login: "biker9", password: "G9t#4Y6w", access: true}
]);

// Создание индексов
db.employe.createIndex({department_id: 1});
db.employe.createIndex({position_id: 1});
db.project.createIndex({employe_id: 1});
db.project.createIndex({department_id: 1});
db.employe_programs.createIndex({employe_id: 1});

