# Runkit Docker

## Scripts

```
docker build -t runkit .
docker run -rm -it -v "${PWD}"/data:/data runkit:latest sh
```