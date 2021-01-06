
FROM node:alpine as build
RUN apk update && apk add bash
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
CMD bash
RUN mkdir /usr/app
WORKDIR /usr/app
ENV PATH /usr/app/node_modules/.bin:$PATH
COPY package.json /usr/app/package.json
RUN npm install --silent
RUN npm install react-scripts -g --silent
COPY . /usr/app
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /usr/app/build /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
