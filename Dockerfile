FROM dbogatov/docker-images:nginx-latest

LABEL maintainer="Duy Do <duyhenry250897@gmail.com>"

ARG PROJECTNAME
ARG PROJECTURL
ARG COMMIT

WORKDIR /srv

# Copy the source
COPY document/dist/ .

RUN /pdf/build-index.sh "$PROJECTNAME" "$PROJECTURL" "$COMMIT"

CMD ["nginx", "-g", "daemon off;"]
