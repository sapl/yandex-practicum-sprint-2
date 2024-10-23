# pymongo-api 

- с шардированием mongo (2 шарда, 1 router).


## Как запустить

Запупуск приложения и mongo серверов

```shell
docker compose up -d
```

Инициализация mongo кластера:

```shell
./scripts/mongo-init.sh
```

Инициализация базы:

```shell
./scripts/mongo-init-data.sh
```


## Как проверить


Status page:
http://localhost:8080

Users:
http://localhost:8080/helloDoc/users

Проверка наличия данных в разных шардах:

```shell
docker exec -it shard2 mongosh --port 27019
use somedb;
db.helloDoc.countDocuments(); 
```