#!/bin/sh
: ${KERB_ADMIN_PASS:=12312312}

rm -f /etc/security/keytab/*.keytab

# name 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey hdfs/name@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey yarn/name@GROUNDUP.COM'   
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey HTTP/name@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey zookeeper/name@GROUNDUP.COM'


# subname
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey hdfs/subname@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey yarn/subname@GROUNDUP.COM'   
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey HTTP/subname@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey zookeeper/subname@GROUNDUP.COM'

# subname
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey hdfs/data01@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey yarn/data01@GROUNDUP.COM'   
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey HTTP/data01@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey zookeeper/data01@GROUNDUP.COM'

# subname
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey hdfs/data02@GROUNDUP.COM' 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey yarn/data02@GROUNDUP.COM'   
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey HTTP/data02@GROUNDUP.COM' 

kadmin -p admin/admin -w $KERB_ADMIN_PASS -q 'addprinc -randkey zkcli@GROUNDUP.COM'

# 생성확인 kadmin 접속후 princrc

# keytab 
kadmin -p admin/admin -w $KERB_ADMIN_PASS -q \
'xst -norandkey -k /etc/security/keytab/hdfs.keytab hdfs/name@GROUNDUP.COM hdfs/subname@GROUNDUP.COM hdfs/data01@GROUNDUP.COM hdfs/data02@GROUNDUP.COM HTTP/name@GROUNDUP.COM HTTP/subname@GROUNDUP.COM HTTP/data01@GROUNDUP.COM HTTP/data02@GROUNDUP.COM'

kadmin -p admin/admin -w $KERB_ADMIN_PASS -q \
'xst -norandkey -k /etc/security/keytab/yarn.keytab yarn/name@GROUNDUP.COM yarn/subname@GROUNDUP.COM yarn/data01@GROUNDUP.COM yarn/data02@GROUNDUP.COM HTTP/name@GROUNDUP.COM HTTP/subname@GROUNDUP.COM HTTP/data01@GROUNDUP.COM HTTP/data02@GROUNDUP.COM'

kadmin -p admin/admin -w $KERB_ADMIN_PASS -q \
'xst -norandkey -k /etc/security/keytab/zookeeper.keytab zookeeper/name@GROUNDUP.COM zookeeper/subname@GROUNDUP.COM zookeeper/data01@GROUNDUP.COM'

kadmin -p admin/admin -w $KERB_ADMIN_PASS -q \
'xst -norandkey -k /etc/security/keytab/zkcli.keytab zkcli@GROUNDUP.COM'


# permission 
chown hdfs:hadoop /etc/security/keytab/hdfs.keytab
chmod 400 /etc/security/keytab/hdfs.keytab
chown yarn:hadoop /etc/security/keytab/yarn.keytab
chmod 400 /etc/security/keytab/yarn.keytab  

chmod 400 /etc/security/keytab/zookeeper.keytab  
chmod 400 /etc/security/keytab/zkcli.keytab

# chown zookeeper:zookeeper /home/zookeeper/zookeeper-3.4.6/conf/zookeeper.keytab
# chmod 400 /home/zookeeper/zookeeper-3.4.6/conf/zookeeper.keytab
# chown zookeeper:zookeeper /home/zookeeper/zookeeper-3.4.6/conf/zkcli.keytab
# chmod 400 /home/zookeeper/zookeeper-3.4.6/conf/zkcli.keytab