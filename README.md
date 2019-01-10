# Runkit Docker

## Scripts

```
docker build -t runkit .
docker run -rrm -it -v "${PWD}"/data:/data runkit:latest sh
```