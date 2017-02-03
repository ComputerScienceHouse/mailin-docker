FROM python:2.7-alpine

# Setup the environment
ENV LISTEN_PORT=2525 \
    MAILIN_USER=mailin \
    MAILIN_HOME=/mailin

# Install dependencies, add user, and link log file
RUN apk add --update --no-cache \
    nodejs \
    spamassassin \
    spamassassin-client \
  && adduser -S $MAILIN_USER \
  && mkdir $MAILIN_HOME \
  && chown -R $MAILIN_USER $MAILIN_HOME \
  && chmod -R 777 $MAILIN_HOME \
  && ln -sf /dev/stdout /var/log/mailin.log

# Install mailin
RUN npm install -g mailin

# Run as a non-priviledged user
USER $MAILIN_USER
WORKDIR $MAILIN_HOME

# Expose a non-priviledged port for SMTP
EXPOSE 2525

CMD ["/bin/sh", "-c", "/usr/bin/mailin --port $LISTEN_PORT --webhook $WEBHOOK_URL"]
