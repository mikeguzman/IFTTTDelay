# To use this with Docker:
# 1. `docker build -t iftttdelay .`
# 2. `docker run -p 3002:3002 -d --init iftttdelay`
# The service will now be listening on http://localhost:3002

FROM node:22-alpine

EXPOSE 3002

ENV NODE_ENV=production

WORKDIR /usr/src/app

# Install packages
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force

# Copy application source into container
COPY . .

# Run as a non-root user for better security
USER node

CMD [ "node", "/usr/src/app/bin/www" ]
