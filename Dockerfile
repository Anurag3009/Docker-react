FROM node:alpine as builder
WORKDIR /home/front_end
COPY package*.json /home/front_end
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /home/front_end/build /usr/share/nginx/html

