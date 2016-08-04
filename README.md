Build
=====

```
docker build -t f5fpc .
```

Run
===

```
docker run \
    --env USER=<username> \
    --env PASSWORD=<password> \
    --env HOST=<host> \
    --name f5fpc \
    -d \
    --privileged \
    --net=host \
    f5fpc
```
