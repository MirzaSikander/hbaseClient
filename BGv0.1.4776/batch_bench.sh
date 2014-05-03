export BG=$PWD
#export BG=/home/msik/git/BGv0.1.4776
export BG_lib=$BG/db/hbase/lib

LOG_DIR=~/logs

export CLASSPATH=$CLASSPATH:$BG_lib/ns-codec-1.7.jar:$BG_lib/hbase-protocol-0.98.0-hadoop2.jar:$BG_lib/commons-configuration-1.6.jar:$BG_lib/htrace-core-2.04.jar:$BG_lib/commons-lang-2.6.jar:$BG_lib/commons-logging-1.1.1.jar:$BG_lib/log4j-1.2.16.jar:$BG_lib/guava-12.0.1.jar:$BG_lib/netty-3.6.6.Final.jar:$BG_lib/hadoop-auth-2.2.0.jar:$BG_lib/protobuf-java-2.5.0.jar:$BG_lib/hadoop-common-2.2.0.jar:$BG_lib/slf4j-api-1.6.4.jar:$BG_lib/hbase-client-0.98.0-hadoop2.jar:$BG_lib/slf4j-log4j12-1.6.4.jar:$BG_lib/hbase-common-0.98.0-hadoop2.jar:$BG_lib/zookeeper-3.4.5.jar:$BG_lib/jackson-all-1.9.0.jar:$BG_lib/commons-codec-1.7.jar

cd $BG/bin 

CMD="java -Xmx4096M edu/usc/bg/BGMainClass"

#Mirza Get ViewProfileActions (All 9 cases)

#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f -p insertimage=false
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_1t_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=false
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_10t_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=false
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_100t_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=false

#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_1t_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_10t_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_100t_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=12

#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation 
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f_500 -p insertimage=true -p imagesize=500
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_1t_500 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=500
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_10t_500 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=500
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_viewprofile_10lt_100t_500 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=500


#Jia ViewProfileActions (All 9 cases)

#$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
#$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_1t_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=false
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_10t_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=false
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_100t_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=false

#$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
#$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_1t_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.JiaHBaseClientt -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_10t_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_100t_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=12

#$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
#$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f_500 -p insertimage=true -p imagesize=500
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_1t_500 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=500
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_10t_500 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=500
#$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_viewprofile_10lt_100t_500 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4 -p insertimage=true -p imagesize=500


#Mirza ListFriendAction

#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_10f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_1t_10f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10

#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_1t_20f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_50f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_1t_50f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_10f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_1t_10f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_1t_20f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_50f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_1t_50f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_10f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_10t_10f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_10t_20f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_50f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_10t_50f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_10f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_10t_10f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_10t_20f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_50f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_10t_50f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_10f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_100t_10f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_100t_20f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_50f
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_100t_50f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_10f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_100t_10f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_100t_20f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20 -p insertimage=true -p imagesize=12
#
#$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
#$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_50f_12 -p insertimage=true -p imagesize=12
#$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_listFriends_100t_50f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50 -p insertimage=true -p imagesize=12

#jia ListFriendAction

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_10f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_1t_10f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_1t_20f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_50f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_1t_50f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_10f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_1t_10f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_1t_20f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_50f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_1t_50f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_10f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_10t_10f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_10t_20f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_50f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_10t_50f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_10f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_10t_10f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_10t_20f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_50f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_10t_50f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_10f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_100t_10f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_100t_20f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_50f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_100t_50f_0 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_10F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_10f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_100t_10f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=10 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_20F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_100t_20f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20 -p insertimage=true -p imagesize=12

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB_50F -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_50f_12 -p insertimage=true -p imagesize=12
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_listFriends_100t_50f_12 -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=50 -p insertimage=true -p imagesize=12

# Mirza Expt 4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricVeryLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymvLowUpdate_1t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricVeryLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymvLowUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricVeryLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymvLowUpdate_100t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymLowUpdate_1t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymLowUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymLowUpdate_100t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricHighUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymHighUpdate_1t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricHighUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymHighUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation
$CMD onetime -load -db hbase.HbaseClientwGet -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_4f
$CMD onetime -t -s -db hbase.HbaseClientwGet -P $BG/workloads/SymmetricHighUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_get_SymHighUpdate_100t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

#Jia expt 4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricVeryLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymvLowUpdate_1t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricVeryLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymvLowUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricVeryLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymvLowUpdate_100t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymLowUpdate_1t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymLowUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymLowUpdate_100t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricHighUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=1 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymHighUpdate_1t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricHighUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymHighUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation
$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_4f
$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricHighUpdateActions -p maxexecutiontime=300 -p usercount=10000 -p threadcount=100 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_get_SymHighUpdate_100t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=4
