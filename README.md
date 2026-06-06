## QNAP gocron 定时任务管理系统  
[![Release](https://img.shields.io/github/v/release/iranee/qnap-gocron?label=Releases&color=2)](https://github.com/iranee/qnap-gocron)


Go语言开发的定时任务集中调度和管理系统, 用于替代Linux-crontab

* 感谢原项目:https://github.com/gocronx-team/gocron

### 全新版本 v1.6.1
- 改用全新项目，从老版本的gocron克隆过来进行了全面升级
- 新版本在旧版本的基础上做了优化，增加了更多功能。
- 不兼容旧版本数据库
### ✨ 功能特性
- Web 界面管理：直观的定时任务管理界面
- 秒级定时：支持 Crontab 时间表达式，精确到秒
- 高可用：基于数据库锁的 Leader 选举，秒级自动故障转移
- 任务重试：支持任务执行失败重试设置
- 任务依赖：支持配置任务依赖关系
- 多用户权限：完善的用户和权限控制
- 双因素认证：支持 2FA，提升系统安全性
- Agent 自动注册：支持 Linux/macOS 一键安装注册
- 多数据库支持：MySQL / PostgreSQL / SQLite
- 日志管理：完整的任务执行日志，支持自动清理
- 消息通知：支持邮件、Slack、Webhook 等多种通知方式

### 截图
![流程图](https://raw.githubusercontent.com/ouqiang/gocron/master/assets/screenshot/scheduler.png)
![任务](https://raw.githubusercontent.com/ouqiang/gocron/master/assets/screenshot/task.png)
![Slack](https://raw.githubusercontent.com/ouqiang/gocron/master/assets/screenshot/notification.png)

## 下载
[releases](https://github.com/iranee/qnap-gocron/releases)  
 
## 如何使用
在QNAP系统，通过App Center手动安装 ***.qpkg*** 后辍程序。

- [x]  支持 x86_64 构架的QNAP存储设备
- [x]  支持 ARM 构架的QNAP存储设备

  
## 安装准备
- 建议使用Sqlite3数据库，首次全新安装，需要设置用户名密码
- 如果要用MySQL数据库，安装前去威联通的管理页面打开MariaDB5服务(原MySQL服务)，位置在：控制台→应用程序→MariaDB
- 如果要用MySQL数据库，在MariaDB里设置用户密码，配置页面需要填入。
