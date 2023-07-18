FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
ARG server_ip
ENV REACT_APP_BACKEND $server_ip
EXPOSE 3000
CMD ["npm", "start"]