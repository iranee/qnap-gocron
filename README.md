## 介绍
Go语言开发的定时任务集中调度和管理系统, 用于替代Linux-crontab

* 开源链接：https://github.com/ouqiang/gocron


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
>  MySQL
>  
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
- 安装前去威联通的管理页面打开MariaDB5服务(原MySQL服务)，位置在：控制台→应用程序→MariaDB
- 在MariaDB里设置用户密码，配置页面需要填入。
