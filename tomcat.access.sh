#!/bin/bash
DefaultJmxterm="/usr/share/munin/plugins/jmxterm.jar"
jmxterm=${jmxterm:-${DefaultJmxterm}}
DefaultJmxport="localhost:10080"
jmxport=${jmxport:-${DefaultJmxport}}
DefaultBeanName='http-8080'
beanName=${beanName:-${DefaultBeanName}}
EPOCH=$(date +'%s')

echo "get -d Catalina -b name=${beanName},type=GlobalRequestProcessor *" | \
java -jar ${jmxterm} -l ${jmxport} -v silent -n | \
#requestCount = 5434;
#bytesReceived = 81;
#bytesSent = 2105;
#errorCount = 416;
sed -r -n "
s/^(requestCount|errorCount)/tomcat.access.\1/
s/^(bytesReceived|bytesSent)/tomcat.traffic.\1/
s/ = /\t/
s/;/\t${EPOCH}/
/(requestCount|bytesReceived|bytesSent|errorCount)/p
"
#tomcat.access.requestCount      5434    1526870547
#tomcat.traffic.bytesReceived    81      1526870547
#tomcat.traffic.bytesSent        2105    1526870547
#tomcat.access.errorCount        416     1526870547
