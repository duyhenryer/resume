FROM dbogatov/docker-images:nginx-latest

LABEL maintainer="Dmytro Bogatov <dmytro@dbogatov.org>"

ARG PROJECTNAME
ARG PROJECTURL
ARG COMMIT

WORKDIR /srv

# Copy the source
COPY document/dist/ .

RUN /pdf/build-index.sh "$PROJECTNAME" "$PROJECTURL" "$COMMIT"

CMD ["nginx", "-g", "daemon off;"]
