Test MonogDB Docker Image
=========================

Demo for Openstack CT meeting for Dockerfile building.

Based on http://docs.docker.io/examples/mongodb/

----

Build the image


```
git clone git@github.com:floehmann/floehmann-mongodb.git
cd floehmann-mongodb
docker build -t <yourname>/mongodb .
```

Start the container and connect to mongo

```
# Regular style
MONGO_ID=$(sudo docker run -d <yourname>/mongodb)

# Lean and mean
MONGO_ID=$(sudo docker run -d <yourname>/mongodb --noprealloc --smallfiles)

# Check the logs out
sudo docker logs $MONGO_ID

# get external ip

docker inspect $(docker ps | grep "floehmann/mongodb" | awk '{print $1}') | grep IPAdd

# Connect and play around
mongo --port <port you get from `docker ps`> --host <external ip of container>

mongo --port 27017 --host 172.17.0.2
```

* test mongo

```
db
use mydb
j = { name : "mongo" }
k = { x : 3 }
db.testData.insert( j )
db.testData.insert( k )
show collections
db.testData.find()
```

