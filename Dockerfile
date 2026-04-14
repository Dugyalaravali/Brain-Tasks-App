FROM nginx:alpine

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy the pre-built Vite files
COPY dist/ /usr/share/nginx/html/

EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
