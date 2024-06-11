# Stage 1: Build stage
FROM node:20-alpine as build

USER root

# Skip downloading Chrome for Puppeteer (saves build time)
ENV PUPPETEER_SKIP_DOWNLOAD=true

<<<<<<< HEAD
# You can install a specific version like: flowise@1.0.0
#RUN npm install -g flowise@1.6.5

build -t flowise:latest .

=======
# Install latest Flowise globally (specific version can be set: flowise@1.0.0)
RUN npm install -g flowise
>>>>>>> f1e78d870e28cb1f4038a0eed537b1be7523ac2c

# Stage 2: Runtime stage
FROM node:20-alpine

# Install runtime dependencies
RUN apk add --no-cache chromium git python3 py3-pip make g++ build-base cairo-dev pango-dev

# Set the environment variable for Puppeteer to find Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Copy Flowise from the build stage
COPY --from=build /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=build /usr/local/bin /usr/local/bin

ENTRYPOINT ["flowise", "start"]
