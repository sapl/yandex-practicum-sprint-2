#!/bin/bash


# Инициализируем кластер и базу


docker exec -it mongos_router mongosh --port 27020 --eval '
  sh.addShard("shard1/shard1:27018");
  sh.addShard("shard2/shard2:27019");
  sh.enableSharding("somedb");
  sh.shardCollection("somedb.helloDoc", { "name" : "hashed" });

  for (var i = 0; i < 1000; i++) {
    db.getSiblingDB("somedb").helloDoc.insert({ age: i, name: "ly" + i });
  }
  var count = db.getSiblingDB("somedb").helloDoc.countDocuments();
  print("Document count: " + count);
'


echo "Shards added, somedb initialized."