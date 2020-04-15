FROM node:alpine as builder
WORKDIR /home/front_end
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/front_end/build /usr/share/nginx/html

