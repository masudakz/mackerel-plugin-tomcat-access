# mackerel-plugin-tomcat-access

Mackerel plugin for Tomcat's requestCount, bytesSent, etc.

[Blog in Japanese](https://qiita.com/masudakz/items/654d65041a7507e59ee3)

## Synopsis

```shell
tomcat.access.sh
```

## Example of mackerel-agent.conf

```
[plugin.metrics.tomcat]
command = "/path/to/tomcat.access.sh"
env = { beanName="jk-8009" }
```

## Graphs and Metrics

### tomcat.access

- tomcat.access.requestCount
- tomcat.access.errorCount

### tomcat.traffic

- tomcat.traffic.bytesSent
- tomcat.traffic.bytesReceive

## Environmental Values

- jmxterm
 - Default: /usr/share/munin/plugins/jmxterm.jar
- jmxport
 - Default: localhost:10080
- beanName
 - Default: http-8080 
