FROM centos:6

RUN yum -y update
RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
RUN yum -y install nginx
# RUN yum -y install wget
# RUN yum -y install gzip

# RUN wget https://downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-5.10.8-x64.bin
WORKDIR /tmp/work
ADD ./atlassian-confluence-5.10.8.tar.gz /tmp/work/
RUN ls /tmp/work/
RUN tar xvzf /tmp/work/atlassian-confluence-5.10.8.tar.gz
# RUN chmod +x atlassian-confluence-5.10.8-x64.bin
# RUN /tmp/work/atlassian-confluence-5.10.8-x64.bin

