# This is a comment
FROM ubuntu:14.04
MAINTAINER fyddaben <838730592@qq.com>
 
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:nicai' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22


# install nginx

RUN apt-get install -y  build-essential libpcre3 libpcre3-dev zlibc zlib1g zlib1g-dev 

RUN wget -P /usr/src/ http://nginx.org/download/nginx-1.9.0.tar.gz  && tar -xvzf /usr/src/nginx-1.9.0.tar.gz -C /usr/src/ 
RUN cd /usr/src/nginx-1.9.0/ && ./configure && make && make install  

RUN rm -rf /usr/local/nginx/conf/nginx.conf

COPY ./nginx.conf /usr/local/nginx/conf/ 

RUN mkdir /usr/local/nginx/conf/vhost && mkdir /home/data && mkdir /home/data/test

COPY ./test.mi.com.conf /usr/local/nginx/conf/vhost/ 

COPY ./index.html /home/data/test/ 





CMD ["/usr/sbin/sshd", "-D"]

