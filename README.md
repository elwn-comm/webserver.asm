# Simple webserver with assembly

So, this is simple webserver.

[Resources](./RESOURCES.md)

## Installation

I used docker container and docker to compile and run binaries.

---
Build docker image with command below:

```bash
docker build -t webserverasm .
```

After build image run it with volume options

```bash
docker run -it -v ./:/home/dev/app webserverasm
```

This will enable interactive commmand line. In that command line use make to build and run program.

```bash
make run
```
