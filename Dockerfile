FROM golang as build

COPY . .

RUN go build -o /remote_syslog .

FROM golang as final

COPY --from=build /remote_syslog /remote_syslog/remote_syslog

RUN chmod +x /remote_syslog/remote_syslog

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
