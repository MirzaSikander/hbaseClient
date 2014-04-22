export BG=$PWD
#export BG=/home/msik/git/BGv0.1.4776
export BG_lib=$BG/db/hbase/lib

LOG_DIR=~/logs

export CLASSPATH=$CLASSPATH:$BG_lib/ns-codec-1.7.jar:$BG_lib/hbase-protocol-0.98.0-hadoop2.jar:$BG_lib/commons-configuration-1.6.jar:$BG_lib/htrace-core-2.04.jar:$BG_lib/commons-lang-2.6.jar:$BG_lib/commons-logging-1.1.1.jar:$BG_lib/log4j-1.2.16.jar:$BG_lib/guava-12.0.1.jar:$BG_lib/netty-3.6.6.Final.jar:$BG_lib/hadoop-auth-2.2.0.jar:$BG_lib/protobuf-java-2.5.0.jar:$BG_lib/hadoop-common-2.2.0.jar:$BG_lib/slf4j-api-1.6.4.jar:$BG_lib/hbase-client-0.98.0-hadoop2.jar:$BG_lib/slf4j-log4j12-1.6.4.jar:$BG_lib/hbase-common-0.98.0-hadoop2.jar:$BG_lib/zookeeper-3.4.5.jar:$BG_lib/jackson-all-1.9.0.jar:$BG_lib/commons-codec-1.7.jar

cd $BG/bin 

CMD="java -Xmx4096M edu/usc/bg/BGMainClass"
$CMD onetime -schema -db hbase.HbaseClientwScan -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation

$CMD onetime -load -db hbase.HbaseClientwScan -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f

$CMD onetime -t -s -db hbase.HbaseClientwScan -P $BG/workloads/ViewProfileAction -p maxexecutiontime=180 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_scan_viewprofile_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation

$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f

$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ViewProfileAction -p maxexecutiontime=180 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_viewprofile_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.HbaseClientwScan -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation

$CMD onetime -load -db hbase.HbaseClientwScan -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f

$CMD onetime -t -s -db hbase.HbaseClientwScan -P $BG/workloads/ListFriendsAction -p maxexecutiontime=180 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_scan_listFriends_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation

$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f

$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/ListFriendsAction -p maxexecutiontime=180 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_listFriends_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.HbaseClientwScan -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_schema_creation

$CMD onetime -load -db hbase.HbaseClientwScan -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/m_populate_20f

$CMD onetime -t -s -db hbase.HbaseClientwScan -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=180 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/m_scan_SymLowUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

$CMD onetime -schema -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_schema_creation

$CMD onetime -load -db hbase.JiaHBaseClient -P $BG/workloads/populateDB -p threadcount=10 -p exportfile=$LOG_DIR/jia_populate_20f

$CMD onetime -t -s -db hbase.JiaHBaseClient -P $BG/workloads/SymmetricLowUpdateActions -p maxexecutiontime=180 -p usercount=10000 -p threadcount=10 -p initapproach=deterministic -p exportfile=$LOG_DIR/jia_SymLowUpdate_10t -p resourcecountperuser=10 -p confperc=1 -p numloadthreads=10 -p useroffset=0 -p friendcountperuser=20

