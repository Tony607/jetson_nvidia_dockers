FROM zcw607/jetson:0.1.0
WORKDIR /home
ENV TZ=Asia/Hong_Kong
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install -y python3-pil
CMD [ "bash" ]