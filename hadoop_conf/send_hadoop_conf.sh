#!/bin/sh

scp core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml ssl-server.xml ssl-client.xml root@name:/etc/hadoop/
scp core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml ssl-server.xml ssl-client.xml root@subname:/etc/hadoop/
scp core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml ssl-server.xml ssl-client.xml root@data01:/etc/hadoop/
scp core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml ssl-server.xml ssl-client.xml root@data02:/etc/hadoop/


