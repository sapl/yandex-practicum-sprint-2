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

docker exec -it shard1-primary mongosh --port 27018 --eval '
  rs.initiate({
    _id: "shard1",
    members: [
             { _id: 0, host: "shard1-primary:27018" },
             { _id: 1, host: "shard1-secondary1:27022" },
             { _id: 2, host: "shard1-secondary2:27023" }
    ]
  });
'

docker exec -it shard2-primary mongosh --port 27019 --eval '
  rs.initiate({
    _id: "shard2",
    members: [
                 { _id: 0, host: "shard2-primary:27019" },
                 { _id: 1, host: "shard2-secondary1:27024" },
                 { _id: 2, host: "shard2-secondary2:27025" }
        ]
  });
'

echo "Initialization of config server and shards completed."