FROM alpine:3.9 AS build

WORKDIR /build

RUN apk add --no-cache \
git \
cmake \
build-base && \
git clone https://github.com/skeeto/endlessh.git && \
cd endlessh && \
make



FROM alpine:3.9

COPY --from=build /build/endlessh/endlessh /endlessh

ENTRYPOINT ["/endlessh", "-v"]

CMD ["-p 22"]

EXPOSE 22/tcp

