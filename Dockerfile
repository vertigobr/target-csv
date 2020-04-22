FROM python:3.8-alpine
ARG version=0.3.0
RUN apk update && \
  apk add --virtual .build-deps gcc musl-dev && \
  pip install target-csv==${version} --no-cache-dir && \
  apk --purge del .build-deps

WORKDIR /app
ENTRYPOINT ["target-csv"]
