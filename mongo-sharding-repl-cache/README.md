# pymongo-api 

- с шардированием mongo (2 шарда, 2 router).
- с репликой каждого шарда (3 ноды на шард)
- с redis кешем


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

Инициализация реплики:

```shell
./scripts/mongo-init-replicaset.sh
```


## Как проверить

### API и статус

Status page:
http://localhost:8080

Users (1000 штук):
http://localhost:8080/helloDoc/users

### Проверка кластера и реплики

Проверка наличия данных в разных шардах:
половина данных будет на первом шарде 

```shell
docker exec -it shard1-primary mongosh --port 27018
use somedb;
db.helloDoc.countDocuments(); 
```

половина на втором (и на каждой из реплик)
```shell
docker exec -it shard2-secondary1 mongosh --port 27024
use somedb;
db.helloDoc.countDocuments(); 
```

### Проверка отказоустойчивости

- Остановить один из `mongo_router` контейнеров
приложение и кластер продолжит работать через второй

- Остановить одну из реплик в шарде:
  данные будут доступны через 2 другие реплики

### Проверка кеширования

- В первый раз открывается долго: http://localhost:8080/helloDoc/users
- Во второй быстро тк кешируются все API ответы
- Чтобы сбросить кеш: 

```shell
redis-cli -h localhost -p 16379
> FLUSHALL
```