FROM alpine/terragrunt:latest
LABEL maintainer="Eric Odell <eric.odell@ucop.edu>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
