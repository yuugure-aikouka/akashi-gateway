# akashi-gateway

The following environment variables are required to run the NGINX Gateway:

- `COMMON_URL`: The URL of the common backend service.

### Example Usage

Run the container with the required environment variables:

```bash
docker build -t akashi-gateway .

docker run -p 8080:80 \
    -e COMMON_URL=https://service-1-xyz.run.app \
    akashi-gateway
```
