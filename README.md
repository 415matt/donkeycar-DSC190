This is a DonkeyCar 5.1 Container for use on DSMLP.

## Build Instructions
1. Build the container for linux/amd64, and tag it as latest.
```bash 
docker build --platform linux/amd64 -t donkeycar:latest .
```
2. Tag the container for Docker Hub. *(If you're not logged in yet, run `docker login` first.)* 
```bash
docker tag donkeycar:latest <yourusername>/donkeycar:latest
```
3.  Push the image to Docker Hub
```bash
docker push <yourusername>/donkeycar:latest
```

## Usage on DSMLP
- [Training DonkeyCar](https://415matt.notion.site/How-To-Train-Donkey-Car-on-DSMLP-82bf506124c44fadaad8e6ab0984c762)