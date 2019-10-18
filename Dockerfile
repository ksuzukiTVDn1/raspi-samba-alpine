FROM alpine:latest

ENV USERNAME="smbuser"
ENV PASSWORD="password"

RUN apk update
RUN apk add samba samba-server

RUN addgroup ${USERNAME}
RUN adduser -H -D -G ${USERNAME} ${USERNAME}
RUN echo -e "${PASSWORD}\n${PASSWORD}" | smbpasswd -a -s ${USERNAME}

COPY smb.conf /etc/samba/smb.conf

CMD ["/usr/sbin/smbd","--foreground","--no-process-group","--log-stdout"]
