FROM polinux/mkdocs AS build
WORKDIR /docs
COPY . /docs
RUN mkdocs build

FROM docker.io/library/nginx:alpine AS final
COPY --from=build /docs/site /usr/share/nginx/html/