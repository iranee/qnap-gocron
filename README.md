## QNAP gocron 定时任务管理系统  
[![Release](https://img.shields.io/github/v/release/iranee/qnap-gocron?label=Releases&color=2)](https://github.com/iranee/qnap-gocron)


Go语言开发的定时任务集中调度和管理系统, 用于替代Linux-crontab

* 开源链接：https://github.com/ouqiang/gocron
* 感谢原项目[[ouqiang/gocron](https://github.com/ouqiang/gocron)]的支持。 

### 版本介绍
> gocron_1.5.5_x86_64_Sqlite3.qpkg  
首次安装可以用此版本，即装即用，使用Sqlite3数据库，默认用户名/密码：admin 123456

> gocron_1.5.5_x86_64_.MySQL.qpkg
之前使用过并创建MySQL数据库，则为升级安装，保留MySql数据。
如果没有安装过，此版本则是全新安装，手动创建MySql 或 Sqlite3数据库

## Update: v1.5.5
* 支持web多点主从高可用
* 支持Sqlite3数据库
* 任务依赖支持DAG工作流
* 支持shell任务调度策略
* 支持最近一次失败任务继续运行
* 即装即用，默认用户名/密码：admin 123456

## 功能特性
* Web界面管理定时任务
* crontab时间表达式, 精确到秒
* 任务执行失败可重试
* 任务执行超时, 强制结束
* 任务依赖配置, A任务完成后再执行B任务
* 账户权限控制
* 任务类型
    * shell任务
    > 在任务节点上执行shell命令, 支持任务同时在多个节点上运行
    * HTTP任务
    > 访问指定的URL地址, 由调度器直接执行, 不依赖任务节点
* 查看任务执行结果日志
* 任务执行结果通知, 支持邮件、Slack、Webhook

### 环境要求
* >  Sqlite3 【默认】
* >  MySQL
### 截图
![流程图](https://raw.githubusercontent.com/ouqiang/gocron/master/assets/screenshot/scheduler.png)
![任务](https://raw.githubusercontent.com/ouqiang/gocron/master/assets/screenshot/task.png)
![Slack](https://raw.githubusercontent.com/ouqiang/gocron/master/assets/screenshot/notification.png)

## 下载
[releases](https://github.com/iranee/qnap-gocron/releases)  
 
## 如何使用
在QNAP系统，通过App Center手动安装 ***.qpkg*** 后辍程序。

- [x]  支持 x86_64 构架的QNAP存储设备
- [ ]  支持 ARM 构架的QNAP存储设备
- [ ]  支持 aach64 构架的QNAP存储设备

  
## 安装准备
- 默认使用Sqlite3数据库，默认用户名密码：admin 123456
- 如果要用MySQL数据库，安装前去威联通的管理页面打开MariaDB5服务(原MySQL服务)，位置在：控制台→应用程序→MariaDB
- 在MariaDB里设置用户密码，配置页面需要填入。
