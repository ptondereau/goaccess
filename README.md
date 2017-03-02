# GoAccess
GoAccess Docker Container
## Usage
```
docker run --rm -it -v /var/log/nginx:/var/log/nginx ptondereau/goaccess
goaccess -f /var/log/nginx/access.log
```
