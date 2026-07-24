# QUEENEE.io — static marketing site
# Serves index.html / ai-receptionist.html / signup.html via nginx.
# Render injects $PORT at runtime; the official nginx image runs envsubst
# across /etc/nginx/templates/*.template on boot, so ${PORT} is resolved there.

FROM nginx:1.27-alpine

# Drop the stock default config so it can't shadow ours
RUN rm -f /etc/nginx/conf.d/default.conf

COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY *.html /usr/share/nginx/html/

# Fallback when PORT isn't injected (local docker run)
ENV PORT=10000
EXPOSE 10000

CMD ["nginx", "-g", "daemon off;"]
