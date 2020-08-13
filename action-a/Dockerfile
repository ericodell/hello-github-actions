ARG VERSION=0.12.28
FROM alpine/terragrunt:${VERSION}
LABEL maintainer="Eric Odell <eric.odell@ucop.edu>"

ARG VERSION
RUN echo terraform image version is $VERSION > /tmp/tf_image_version
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
