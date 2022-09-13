#Build Phase
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



#Run Phase

# /app/build <-- all the stuff we care about
FROM nginx

#Exposing port
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html