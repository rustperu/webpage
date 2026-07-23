FROM nginx:alpine

# Copiar archivos del sitio web
COPY index.html /usr/share/nginx/html/
COPY background.avif /usr/share/nginx/html/
COPY rust-peru.png /usr/share/nginx/html/
COPY rust.png /usr/share/nginx/html/
COPY sitemap.xml /usr/share/nginx/html/
COPY robots.txt /usr/share/nginx/html/
COPY manifest.json /usr/share/nginx/html/

# Copiar galería de fotos de eventos
COPY gallery/ /usr/share/nginx/html/gallery/

# Copiar configuración personalizada de Nginx (opcional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer puerto 80
EXPOSE 80

# El comando por defecto de nginx:alpine ya inicia nginx
CMD ["nginx", "-g", "daemon off;"]
