# 在线考试系统

* ## 系统介绍

     该项目是一个前后端分离，后端使用 SpringBoot，前端使用 VUE 和 Element-UI 组件库配合完成开发。

* ## 在线浏览地址
    温馨提示：请登录后台的朋友,不要删除计算机网络这套试卷，因为目前只添加了这套试卷的题目作为测试，删了，其他人就不能答题了。
    
    ~~[在线考试系统](http://gopikachu.top/ "在线考试系统")~~（服务器到期，已不能访问）


* ## 页面截图
  ![登录](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E7%99%BB%E5%BD%95.png?raw=true)

  <center>登录</center>

![试卷列表](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E8%AF%95%E5%8D%B7%E5%88%97%E8%A1%A8.png?raw=true)

<center>试卷列表</center>

![答题模块](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E7%AD%94%E9%A2%98%E6%A8%A1%E5%9D%97.png?raw=true)

<center>答题模块</center>

![练习模式](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E7%BB%83%E4%B9%A0%E6%A8%A1%E5%BC%8F.png?raw=true)

<center>练习模式</center>

![留言模块](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E7%95%99%E8%A8%80%E6%A8%A1%E5%9D%97.png?raw=true)

<center>留言模块<center/>

![后台管理](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86.png?raw=true)

<center>后台管理</center>

![学生成绩](https://github.com/YXJ2018/SpringBoot-Vue-OnlineExam/blob/master/img/%E5%AD%A6%E7%94%9F%E6%88%90%E7%BB%A9%E6%8A%98%E7%BA%BF%E5%9B%BE.png?raw=true)

<center>学生成绩</center>
     
# 環境構築手順書
![image](https://user-images.githubusercontent.com/81153158/180644328-5fd14b63-d645-42d0-8f13-9f11c9515545.png)

* ## ①linux环境搭建
     
    参照：
     
     使用vagrant快速创建linux虚拟机 https://youtu.be/okgLTU3mMs8
     
     虚拟机网络设置 https://youtu.be/GrXzq8ZvcRc
     
　
visualBox进行安装需要cpu开启虚拟化，在开机启动的时候设置主板，CPU configuration，然后点击Intel Vitualization Technology。重启电脑
     
普通安装linux虚拟机太麻烦，可以利用vagrant可以帮助我们快速地创建一个虚拟机。主要装了vitualbox，vagrant可以帮助我们快速创建出一个虚拟机。他有一个镜像仓库。
     
去https://www.vagrantup.com/ 下载vagrant安装，安装后重启系统。cmd中输入vagrant有版本代表成功了。
输入vagrant init centos/7，即可初始化一个centos7系统。（注意这个命令在哪个目录下执行的，他的Vagrantfile就生成在哪里）
vagrant up启动虚拟机环境。
     
启动后出现default folder:/cygdrive/c/User/… =>/vagrant。然后ctrl+c退出

前面的页面中有ssh账号信息。vagrant ssh 就会连上虚拟机。可以使用exit退出

下次使用也可以直接vagrant up直接启动，但要确保当前目录在C:/用户/ 文件夹下，他下面有一个Vagrantfile，不过我们也可以配置环境变量。

启动后再次vagrant ssh连上即可

不过他使用的网络方式是网络地址转换NAT（端口转发），如果其他主机要访问虚拟机，必须由windows端口如3333断发给虚拟机端口如3306。这样每在linux里安一个软件都要进行端口映射，不方便，（也可以在virualBox里挨个设置）。我们想要给虚拟机一个固定的ip地址，windows和虚拟机可以互相ping通。

visualBox的网络模式可以参考：https://mp.weixin.qq.com/s?__biz=MzI5MDg4ODEzOA==&mid=2247488277&idx=1&sn=012c33bec2984a61850b30b1bb270812&scene=21#wechat_redirect

方式1是在虚拟机中配置静态ip。

方式2：更改Vagrantfile更改虚拟机ip，修改其中的config.vm.network "private_network",ip:"192.168.56.10"，这个ip需要在windows的ipconfig中查到vitualbox的虚拟网卡ip，然后更改下最后一个数字就行（不能是1，1是我们的主机）。配置完后vagrant reload重启虚拟机。在虚拟机中ip addr就可以查看到地址了。互相ping也能ping通。

关掉防火墙，VirualBox中第一个网卡设置NAT，第二个网卡设置仅主机

如果ping不了baidu

cd /etc/sysconfig/network-scripts

ls 一般有ifcfg-eth0 1

ip addr 看哪个网格是192.168.56网段，然后vim他

vim ifcfg-eth1 加入

GATEWAY=192.168.56.1
     
DNS1=114.114.114.114
     
DNS2=8.8.8.8

service network restart

默认只允许ssh登录方式，为了后来操作方便，文件上传等，我们可以配置允许账号密码登录

vim /etc/ssh/sshd_config
     
修改
     
PasswordAuthentication yes
     
重启
     
service sshd restart
     
账号root
     
密码vagrant

配置源

 备份原yum源

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
     
 使用新yum源
     
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
     
 生成缓存
     
yum makecache

* ## ②虚拟机安装docker
     
     参照：
     
     linux安装docker：https://youtu.be/07ed7Ts5eX8
     
     docker官网DOC：https://docs.docker.com/engine/install/centos/

卸载系统之前的docker 
     
sudo yum remove docker \
     
                  docker-client \
     
                  docker-client-latest \
     
                  docker-common \
     
                  docker-latest \
     
                  docker-latest-logrotate \
     
                  docker-logrotate \
     
                  docker-engine                  
                  
sudo yum install -y yum-utils

配置镜像
     
sudo yum-config-manager \
     
    --add-repo \
     
    https://download.docker.com/linux/centos/docker-ce.repo
    
sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker
     
设置开机自启动
     
sudo systemctl enable docker

docker -v
     
sudo docker images

根据页面命令执行完命令

sudo mkdir -p /etc/docker
     
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://chqac97z.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
     
sudo systemctl restart docker
