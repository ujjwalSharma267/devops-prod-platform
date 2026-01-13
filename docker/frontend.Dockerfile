# ---------- STAGE 1: BUILD ----------
FROM node:18-alpine AS build

WORKDIR /app/frontend

COPY app/frontend/package*.json ./
RUN npm install

COPY app/frontend/ .
RUN npm run build

# ---------- STAGE 2: RUNTIME ----------
FROM nginx:alpine

COPY --from=build /app/frontend/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
