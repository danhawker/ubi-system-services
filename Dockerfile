FROM registry.redhat.io/ubi7/ubi-init

RUN yum -y install --disableplugin=subscription-manager http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm; \
    yum -y install usbutils libusb-compat freeipmi nut nut-client; \
    yum  --disableplugin=subscription-manager clean all; \
    rm -rf /var/cache/yum

RUN systemctl enable nut-server; systemctl enable nut-monitor

VOLUME /etc/nut

EXPOSE 3493

CMD [ "/sbin/init" ]