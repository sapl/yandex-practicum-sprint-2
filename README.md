# Спринт 2.

## Задание 1

Публичная ссылка на схему (6 страниц):  
https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Yandex-Practicum-Sprint-2.drawio#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1bWkaDLWQyeUEV5zZl7ktwLXCRpYYT9bT%26export%3Ddownload

Ссылка на файл в Drive:  
https://drive.google.com/file/d/1bWkaDLWQyeUEV5zZl7ktwLXCRpYYT9bT/view?usp=drive_link


## Задание 2

- Шард+реплики+кеш, инструкция по установке:  
 [mongo-sharding-repl-cache](mongo-sharding-repl-cache/README.md)


- Шард+реплики:  
  [mongo-sharding-repl](mongo-sharding-repl/README.md)
  (здесь пример с 2-мя роутерами)


- Только шард:  
  [mongo-sharding-repl](mongo-sharding/README.md)

> **Примечания:**   
> - Если указать 2 роутера в подключении питон-сервиса, то статус-страница ошибку отдает,
> так как надо заккоментировать ` "mongo_address": client.address`.
> Потому с  image kazhem/pymongo_api только один роутер можно указывать.
> 
> - Не совсем понял что там за логика получения данных про реплики для статус страницы, 
> в режиме шарда показывает только про шарды. С этим разбираться не стал.
> 
> - Сервер конфигурации также руплицирован на 3 реплики (на схеме drawio). 
> В hello world примере это опустил итак уже тут 6 реплик.