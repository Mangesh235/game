# Use a suitable base image (e.g., Nginx to serve static files)
FROM nginx:alpine 

# Copy static assets into the image
COPY . /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

