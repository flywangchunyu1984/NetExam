/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.38 : Database - exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `exam`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ＩＤ',
  `adminName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '氏名',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性別',
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '電話番号',
  `email` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT 'メール宛先',
  `pwd` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT 'パスワード',
  `cardId` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '社員ＩＤ',
  `role` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'キャラクター(0システム管理者，1テスト管理者，2研修参加者)',
  PRIMARY KEY (`adminId`) USING BTREE,
  KEY `sex` (`sex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100000002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='システム管理者マスタ';

/*Data for the table `admin` */

insert  into `admin`(`adminId`,`adminName`,`sex`,`tel`,`email`,`pwd`,`cardId`,`role`) values 
(100000001,'スーパー管理者','男','13658377857','kibanadmin@ietech.co.jp','123456','E00000','0');

/*Table structure for table `exam_manage` */

DROP TABLE IF EXISTS `exam_manage`;

CREATE TABLE `exam_manage` (
  `examCode` int(9) NOT NULL AUTO_INCREMENT COMMENT '研修番号',
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'テスト紹介',
  `source` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `paperId` int(10) DEFAULT NULL COMMENT 'テスト番号',
  `examDate` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'テスト日付',
  `totalTime` int(3) DEFAULT NULL,
  `grade` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `term` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `major` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `institute` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `totalScore` int(4) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tips` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'コメント',
  PRIMARY KEY (`examCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20220002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='テストマスタ';

/*Data for the table `exam_manage` */

insert  into `exam_manage`(`examCode`,`description`,`source`,`paperId`,`examDate`,`totalTime`,`grade`,`term`,`major`,`institute`,`totalScore`,`type`,`tips`) values 
(20220001,'2022年第一回セキュリティ研修','2022年第一回セキュリティ研修',1001,'2022-07-22',9999,'2020','1','新日(日本)','新日',100,'セキュリティ研修','選択問題。以下の問いを読んで、選択肢からあてはまるものを選んでください。');

/*Table structure for table `fill_question` */

DROP TABLE IF EXISTS `fill_question`;

CREATE TABLE `fill_question` (
  `questionId` int(9) NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `question` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `analysis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `score` int(2) DEFAULT '2',
  `level` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `section` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10029 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `fill_question` */

/*Table structure for table `judge_question` */

DROP TABLE IF EXISTS `judge_question`;

CREATE TABLE `judge_question` (
  `questionId` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `question` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `analysis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `score` int(2) DEFAULT '2',
  `level` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `section` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `judge_question` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `message` */

/*Table structure for table `multi_question` */

DROP TABLE IF EXISTS `multi_question`;

CREATE TABLE `multi_question` (
  `questionId` int(9) NOT NULL AUTO_INCREMENT COMMENT '問題ＩＤ',
  `subject` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `question` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '問題詳細',
  `answerA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '選択肢Ａ',
  `answerB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '選択肢Ｂ',
  `answerC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '選択肢Ｃ',
  `answerD` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '選択肢Ｄ',
  `rightAnswer` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '正解回答',
  `analysis` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '解析',
  `score` int(2) DEFAULT '2' COMMENT '得点',
  `section` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `level` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10033 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='選択問題マスタ';

/*Data for the table `multi_question` */

insert  into `multi_question`(`questionId`,`subject`,`question`,`answerA`,`answerB`,`answerC`,`answerD`,`rightAnswer`,`analysis`,`score`,`section`,`level`) values 
(10000,NULL,'DNS 服务器和DHCP服务器的作用是（）','将IP地址翻译为计算机名，为客户机分配IP地址','将IP地址翻译为计算机名、解析计算机的MAC地址','将计算机名翻译为IP地址、为客户机分配IP地址','将计算机名翻译为IP地址、解析计算机的MAC地址','C',NULL,10,'应用层','2'),
(10001,NULL,'HTTP协议通常使用什么协议进行传输（）','ARP','DHCP','UDP','TCP','D',NULL,10,'应用层','2'),
(10003,NULL,'查看DNS缓存记录的命令（）','ipconfig/displaydns','nslookup','ipconfig/release','ipconfig/flushdns','A',NULL,10,'应用层','3'),
(10004,NULL,'DHCP(        )报文的目的IP地址为255.255.255.255','DhcpDisover','DhcpOffer','DhcpAck','DhcpNack','A',NULL,10,'应用层','2'),
(10005,NULL,'下列地址中，（  ）不是DHCP服务器分配的IP地址','196.254.109.100','169.254.12.42','69.254.48.45','96.254.54.15','B',NULL,10,'应用层','2'),
(10006,NULL,'DHCP通常可以为客户端自动配置哪些网络参数（）','IP，掩码，网关，DNS','IP，掩码，域名，SMTP','网关，掩码，浏览器，FTP','IP，网关，DNS，服务器','A',NULL,10,'应用层','2'),
(10007,NULL,'DNS服务器在名称解析过程中正确的查询顺序为（）','本地缓存记录→区域记录→转发域名服务器→根域名服务器','区域记录→本地缓存记录→转发域名服务器→根域名服务器','本地缓存记录→区域记录→根域名服务器→转发域名服务器','区域记录→本地缓存记录→根域名服务器→转发域名服务器','A',NULL,10,'应用层','3'),
(10008,NULL,'在TCP/IP协议中，序号小于（  ）的端口称为熟知端口(well-known port)。','1024','64','256','128','A',NULL,10,'传输层','1'),
(10009,NULL,'在Internet上用TCP/IP播放视频，想用传输层的最快协议，以减少时延，要使用（ ）','UDP协议的低开销特性','UDP协议的高开销特性','TCP协议的低开销特性','TCP协议的高开销特性','A',NULL,10,'传输层','2'),
(10010,NULL,'在TCP协议中采用（ ）来区分不同的应用进程','端口号','IP地址','协议类型','MAC地址','A',NULL,10,'传输层','3'),
(10011,NULL,'可靠的传输协议中的“可靠”指的是（ ）','使用面向连接的会话','使用“尽力而为”的传输','使用滑动窗口来维持可靠性','使用确认重传机制来确保传输的数据不丢失','D',NULL,10,'传输层','2'),
(10012,NULL,'假设拥塞窗口为50KB，接收窗口为80KB，TCP能够发送的最大字节数为（ ）','50KB','80KB','130KB','30KB','A',NULL,10,'传输层','4'),
(10013,NULL,'主机A向主机B发送一个（SYN=1，seq=2000）的TCP报文，期望与主机B建立连接，若主机B接受连接请求，则主机B发送的正确有TCP报文可能是（ ）','（SYN=0,ACK=0,seq=2001,ack=2001）','（SYN=1,ACK=1,seq=2000,ack=2000）','•	C.（SYN=1,ACK=1,seq=2001,ack=2001）','（SYN=0,ACK=1,seq=2000,ack=2000）','C',NULL,10,'传输层','2'),
(10014,NULL,'主机A向主机B连续发送了两个TCP报文段，其序号分别为70和100。试问： （1）第一个报文段携带了（）个字节的数据？',' 70','30','100','170','B',NULL,2,'传输层','3'),
(10015,NULL,'PCM脉码调制的过程（ ）','采样、量化、编码','量化、编码、采样','编码、量化、采样','采样、编码、量化','A',NULL,2,'物理层','4'),
(10016,NULL,'若某采用4相位调制的通信链路的数据传输速率为2400bps，则该链路的波特率为（）','600Baud','1200Baud','4800Baud','9600Baud','B',NULL,2,'物理层','1'),
(10017,NULL,'以下关于数据传输速率的描述中，错误的是( )','数据传输速率表示每秒钟传输构成数据代码的二进制比特数','对于二进制数据，数据传输速率为S=1/T (bps)','常用的数据传输速率单位有: 1Mbps=1.024×106bps','数据传输速率是描述数据传输系统性能的重要技术指标之一','C',NULL,2,'物理层','2'),
(10018,NULL,'以下关于时分多路复用概念的描述中，错误的是.(  ).','时分多路复用将线路使用的时间分成多个时间片','时分多路复用分为同步时分多路复用与统计时分多路复用','时分多路复用使用“帧”与数据链路层“帧”的概念、作用是不同的','统计时分多路复用将时间片预先分配给各个信道','D',NULL,2,'物理层','2'),
(10019,NULL,'1000BASE-T标准支持的传输介质是（）','双绞线','同轴电缆','光纤','无线电','A',NULL,2,'物理层','1'),
(10020,NULL,'一个以太网交换机，读取整个数据帧，对数据帧进行差错校验后再转发出去，这种交换方式称为 （）','直通交换','无碎片交换','无差错交换','存储转发交换','D',NULL,2,'数据链路层','2'),
(10021,NULL,'关于VLAN，下面的描述中正确的是（）','一个新的交换机没有配置VLAN','通过配置VLAN减少了冲突域的数量','一个VLAN不能跨越多个交换机','各个VLAN属于不同的广播域','D',NULL,2,'数据链路层','2'),
(10022,NULL,'以太网协议中使用物理地址作用是什么？','.用于不同子网中的主机进行通信','作为第二层设备的唯一标识','用于区别第二层第三层的协议数据单元','保存主机可检测未知的远程设备','B',NULL,2,'数据链路层','2'),
(10023,NULL,'以太网采用的CSMA/CD协议，当冲突发生时要通过二进制指数后退算法计算后退延时， 关于这个算法，以下论述中错误的是 （）','冲突次数越多，后退的时间越短','平均后退次数的多少与负载大小有关','后退时延的平均值与负载大小有关','重发次数达到一定极限后放弃发送','A',NULL,2,'数据链路层','3'),
(10024,NULL,'以下关于交换机获取与其端口连接设备的MAC地址的叙述中，正确的是（）','交换机从路由表中提取设备的MAC地址','交换机检查端口流入分组的源地址','交换机之间互相交换地址表','网络管理员手工输入设备的MAC地址','B',NULL,2,'数据链路层','2'),
(10025,NULL,'如果G (x）为11010010，以下4个CRC校验比特序列中只有哪个可能是正确的 ？','1101011001','101011011','11011011','1011001','B',NULL,2,'数据链路层','1'),
(10026,NULL,'以下关于Ethernet物理地址的描述中，错误的是','Ethernet物理地址又叫做MAC地址','48位的Ethernet物理地址允许分配的地址数达到247个','网卡的物理地址写入主机的EPROM中','每一块网卡的物理地址在全世界是唯一的','C',NULL,2,'数据链路层','3'),
(10027,NULL,'下列帧类型中，不属于HDLC帧类型的是（）','信息帧','确认帧','监控帧','无编号帧','B',NULL,2,'数据链路层','1'),
(10028,NULL,'通过交换机连接的一组站点，关于它们的广播域和冲突域说法正确的是（）','组成一个冲突域，但不是一个广播域','组成一个广播域，但不是一个冲突域','组成一个冲突域，也是一个广播域','既不一个冲突域，也不是一个广播域','B',NULL,2,'数据链路层','3'),
(10029,NULL,'数据链路层的数据单位是（）','帧','字节','比特','分组','A',NULL,2,'数据链路层','1'),
(10030,NULL,'LAN参考模型可分为物理层、（ ）','MAC，LLC等三层','LLC，MHS等三层','MAC，FTAM等三层','LLC，VT等三层','A',NULL,2,'数据链路层','3'),
(10031,NULL,'测试','A','B','C','D','B','解析',2,'测试','4'),
(10032,NULL,'DNS 服务器和DHCP服务器的作用是（）','A','B','C','D','B','哦解析',2,'网络层','2');

/*Table structure for table `paper_manage` */

DROP TABLE IF EXISTS `paper_manage`;

CREATE TABLE `paper_manage` (
  `paperId` int(9) DEFAULT NULL COMMENT 'テスト番号',
  `questionType` int(1) DEFAULT NULL COMMENT '問題種類',
  `questionId` int(9) DEFAULT NULL COMMENT '問題ＩＤ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='テスト問題マスタ';

/*Data for the table `paper_manage` */

insert  into `paper_manage`(`paperId`,`questionType`,`questionId`) values 
(1001,1,10000),
(1001,1,10009),
(1001,1,10003),
(1001,1,10005),
(1001,1,10004),
(1001,1,10012),
(1001,1,10011),
(1001,1,10006),
(1001,1,10008),
(1001,1,10001);

/*Table structure for table `replay` */

DROP TABLE IF EXISTS `replay`;

CREATE TABLE `replay` (
  `messageId` int(255) DEFAULT NULL,
  `replayId` int(9) NOT NULL AUTO_INCREMENT,
  `replay` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `replayTime` date DEFAULT NULL,
  PRIMARY KEY (`replayId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `replay` */

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `scoreId` int(9) NOT NULL AUTO_INCREMENT COMMENT '得点ＩＤ',
  `examCode` int(9) DEFAULT NULL COMMENT '試験番号',
  `studentId` int(9) DEFAULT NULL COMMENT '研修参加者ＩＤ',
  `subject` varchar(20) COLLATE utf8_bin NOT NULL,
  `ptScore` int(5) DEFAULT NULL,
  `etScore` int(5) DEFAULT NULL,
  `score` int(5) DEFAULT NULL COMMENT '得点',
  `answerDate` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '回答日付',
  PRIMARY KEY (`scoreId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='成績トランザクション';

/*Data for the table `score` */

insert  into `score`(`scoreId`,`examCode`,`studentId`,`subject`,`ptScore`,`etScore`,`score`,`answerDate`) values 
(2,20220001,120000001,'2022年第一回セキュリティ研修',NULL,0,NULL,'2022-07-16');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `studentId` int(9) NOT NULL AUTO_INCREMENT COMMENT '研修参加者ＩＤ',
  `studentName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '氏名',
  `grade` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `major` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `clazz` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `institute` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '電話番号',
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'メール宛先',
  `pwd` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT 'パスワード',
  `cardId` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '社員ＩＤ',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性別',
  `role` varchar(1) COLLATE utf8_bin DEFAULT '2' COMMENT 'キャラクター(0システム管理者，1テスト管理者，2研修参加者)',
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120000002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='研修参加者マスタ';

/*Data for the table `student` */

insert  into `student`(`studentId`,`studentName`,`grade`,`major`,`clazz`,`institute`,`tel`,`email`,`pwd`,`cardId`,`sex`,`role`) values 
(120000001,'隔壁老王','2020','新日(日本)','1','新日','13585439532','gblw@163.com','123456','E00000','男','2');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacherId` int(9) NOT NULL AUTO_INCREMENT COMMENT 'テスト管理者ＩＤ',
  `teacherName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '氏名',
  `institute` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性別',
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '電話番号',
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'メール宛先',
  `pwd` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT 'パスワード',
  `cardId` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '社員ＩＤ',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'キャラクター(0システム管理者，1テスト管理者，2研修参加者)',
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110000002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='教师信息表';

/*Data for the table `teacher` */

insert  into `teacher`(`teacherId`,`teacherName`,`institute`,`sex`,`tel`,`email`,`pwd`,`cardId`,`type`,`role`) values 
(110000001,'隔壁老王',NULL,'男','13598458442','13598458442@163.com','123456','E00000',NULL,'1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
