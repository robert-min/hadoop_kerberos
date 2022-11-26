#!/bin/sh
scp hdfs.keytab yarn.keytab root@name:/etc/security/keytab
scp hdfs.keytab yarn.keytab root@subname:/etc/security/keytab
scp hdfs.keytab yarn.keytab root@data01:/etc/security/keytab
scp hdfs.keytab yarn.keytab root@data02:/etc/security/keytab

scp zookeeper.keytab zkcli.keytab root@name:/home/zookeeper/zookeeper-3.4.6/conf
scp zookeeper.keytab zkcli.keytab root@subname:/home/zookeeper/zookeeper-3.4.6/conf
scp zookeeper.keytab zkcli.keytab root@data01:/home/zookeeper/zookeeper-3.4.6/conf