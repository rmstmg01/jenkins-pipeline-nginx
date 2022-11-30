FROM nginx

COPY wrapper.sh /

CMD ["./wrapper.sh"]
