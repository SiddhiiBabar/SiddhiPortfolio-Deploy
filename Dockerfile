FROM nginx:alpine
COPY index.html style.css /usr/share/nginx/html/
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O /dev/null http://localhost/ || exit 1
CMD ["nginx","-g","daemon off;"]
