#!/bin/bash


# Инициализируем кластер

docker exec -it configSrv mongosh --eval '
  rs.initiate({
    _id: "config_server",
    configsvr: true,
    members: [
      { _id: 0, host: "configSrv:27017" }
    ]
  });
'

docker exec -it shard1 mongosh --port 27018 --eval '
  rs.initiate({
    _id: "shard1",
    members: [
      { _id: 0, host: "shard1:27018" }
    ]
  });
'

docker exec -it shard2 mongosh --port 27019 --eval '
  rs.initiate({
    _id: "shard2",
    members: [
      { _id: 1, host: "shard2:27019" }
    ]
  });
'

echo "Initialization of config server and shards completed."