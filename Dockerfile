FROM   debian:stretch-slim    
ENV LANG zh_CN.UTF-8
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
ADD ./prometheus-2.16.0.linux-amd64.tar.gz  /opt
RUN mv /opt/prometheus-2.16.0.linux-amd64 /opt/prometheus  && mkdir -p /opt/prometheus/temples  && rm -rf /opt/prometheus/prometheus.yml  
COPY ./prometheus.yml.temp /opt/prometheus/temples
ADD ./rules.tar.gz      /opt/prometheus/temples 
ADD ./sd_config.tar.gz  /opt/prometheus/temples 
COPY ./start.sh  /start.sh

CMD ["/start.sh", "run" ]
