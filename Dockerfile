# use an existing docker image as a base
FROM node:alpine as builder

WORKDIR /app

# download and install dependency
COPY ./package.json ./
RUN npm install
COPY ./ ./
# tell image what to do when it start as container
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
