FROM python:3.8-alpine as builder
ARG version=0.3.0
RUN apk update && \
  apk add --virtual .build-deps gcc musl-dev && \
  pip install --user target-csv==${version} --no-cache-dir

FROM python:3.8-alpine
RUN adduser -h /app -D worker
COPY --from=builder --chown=worker:worker /root/.local /app/.local
USER worker
ENV PATH=/app/.local/bin:$PATH
WORKDIR /app
ENTRYPOINT ["target-csv"]
CMD ["-c","/opt/config/config.json"]
