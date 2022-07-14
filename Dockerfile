FROM alpine:3.15.4

#ARG USERNAME=prowler
#ARG USERID=34000

#RUN addgroup -g ${USERID} ${USERNAME} && \
#    adduser -s /bin/sh -G ${USERNAME} -D -u ${USERID} ${USERNAME} && \
RUN apk --update --no-cache add python3 bash curl jq file coreutils && \
    apk add cmd:pip3 && \
    pip3 install --upgrade pip && \
    pip install awscli boto3 detect-secrets

WORKDIR /prowler

COPY . ./

#RUN chown -R prowler .

#USER ${USERNAME}

# Start the docker in daemon mode
CMD while true; do echo hello; sleep 60; done
