#!env perl
#Author: autoCreated
my $para_num = "2";
# 配置模板创建时间
my $template_time = "2020-05-14 20:11:34";
my %para;
@array_pre_flag = ();
@array_appendix_flag = ();

$para{Linux_su_user} = $ARGV[0];
$para{Linux_su_password} = $ARGV[1];

# 处理检查项中的执行命令

$pre_cmd{16822} = "cat \"/etc/inittab\"";
$pre_cmd{17298} = "find / -maxdepth 2 -type f -name hosts.equiv 2>/dev/null| grep -v -c -i \"find[[:space:]]*:\"";
$pre_cmd{12448} = "cat \"/etc/security/limits.conf\"";
$pre_cmd{12848} = "cat \"/etc/security/limits.conf\"";
$pre_cmd{8119} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | grep -v \"export\" | sed 's/[^0-9]//g'
cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | sed 's/[^0-9]//g'";
$pre_cmd{62795} = "chkconfig --list 2> /dev/null | grep \"^bootps\"";
$pre_cmd{17483} = "find / -maxdepth 3 -type f -name .rhosts 2>/dev/null | grep -v -c -i \"find[[:space:]]*:\"";
$pre_cmd{23934} = "(cat /etc/pam.d/su | grep pam_rootok | grep \"^[[:space:]]*[^#]\";cat /etc/pam.d/su | grep pam_wheel.so | grep \"^[[:space:]]*[^#]\") | awk '{ORS=\",\"}{print \$0}'";
$pre_cmd{6} = "if [ -s /boot/grub/menu.lst ];then echo  '1';else echo '0';fi";
$pre_cmd{35584} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/common-password ];then suse_ret=`cat /etc/pam.d/common-password | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret2=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*pam_unix.so[[:space:]]*md5[[:space:]]*shadow[[:space:]]*nullok[[:space:]]*try_first_pass[[:space:]]*use_authtok[[:space:]]*\" | grep \"remember=5\"`;fi
if [ -n \"\$red_ret\" ];then echo \"redhat:valid\";elif [ -n \"\$suse_ret\" ]; then echo \"suse:valid\";elif [ -n \"\$suse_ret2\" ];then echo \"suse2:valid\";else echo \"ret:invalid\";fi";
$pre_cmd{62738} = "unset ret_1 ret_2;
if [ -f /etc/ssh/sshd_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;elif [ -f /etc/ssh2/sshd2_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;else echo \"ret:valid\";fi
unset ret_1 ret_2;";
$pre_cmd{27888} = "netstat -an | grep \":23\\b\"";
$pre_cmd{63647} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$pre_cmd{18043} = "cat \"/etc/profile\"";
$pre_cmd{18279} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTFILESIZE\" | awk -F= '{print \$2}'";
$pre_cmd{64629} = "LANG=c;
find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;
echo \"result=\"`find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;|wc -l`;";
$pre_cmd{15910} = "cat /etc/snmp/snmpd.conf 2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*public[[:space:]]*\" ";
$pre_cmd{5} = "if [ -s /etc/lilo.conf ];then echo  '1';else echo '0';fi";
$pre_cmd{61940} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`;
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;echo +++++++++vsftpd.conf+++++++++++++++++;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++vsftpd.conf end+++++++++++++;ls_recurse_enable=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"ls_recurse_enable=YES\"|wc -l`;local_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"local_umask=022\"|wc -l`;anon_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"anon_umask=022\"|wc -l`;VSFTPD_NO=\$(expr \$ls_recurse_enable + \$local_umask + \$anon_umask);if [ \$VSFTPD_NO -eq 3 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false\";fi;unset FTPCONF VSFTPD_NO ls_recurse_enable local_umask anon_umask; }
function Check_pureftpd(){ echo +++++++++pure-ftpd.conf+++++++++++++++++;cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++pure-ftpd.conf end+++++++++++++;if [ `cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"Umask\"|grep -i \"177:077\"|wc -l` == 1 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false\";fi; }
if [ \$FTPSTATUS = 0 ];then echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;
unset FTPSTATUS;";
$pre_cmd{9109} = "if [ -s /etc/lilo.conf ];then cat /etc/lilo.conf | grep -v \"^[[:space:]]#\" | grep \"password\";fi";
$pre_cmd{9652} = "cat \"/boot/grub/menu.lst\"";
$pre_cmd{25992} = "cat /etc/login.defs | grep -v \"^[[:space:]]*#\" | grep -i \"^[[:space:]]*umask\"";
$pre_cmd{21560} = "df -k";
$pre_cmd{60395} = "unset syslogd_status syslogng_status rsyslogd_status LOGDIR;
syslogd_status=`ps -ef |grep ' syslogd '|grep -v \"grep\"|wc -l`;
syslogng_status=`ps -ef |grep \"/syslog-ng\"|grep -v \"grep /syslog-ng\"|wc -l`;
rsyslogd_status=`ps -ef | grep \"\\/rsyslogd \" | grep -v \"grep\" |wc -l`;
if [ \$syslogd_status != 0 ];then LOGDIR=`if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf| grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}';fi`;ls -l \$LOGDIR 2>/dev/null | grep  \"^-\" | cut -b 5-10;elif [ \$rsyslogd_status != 0 ];then LOGDIR=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}'`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;elif [[ \$syslogng_status != 0 ]];then LOGDIR=`cat /etc/syslog-ng/syslog-ng.conf|grep -v \"^[[:space:]]*#\"|grep \"^destination\"|grep file|cut -d\\\" -f2`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;else echo \"syslog is not running.\";fi;
unset syslogd_status syslogng_status rsyslogd_status LOGDIR;";
$pre_cmd{10436} = "unset num;
unset filename;
if [ -s /etc/csh.login ];then filename=/etc/csh.login;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename
";
$pre_cmd{32629} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$pre_cmd{10890} = "unset num;
unset filename;
if [ -s /etc/bashrc ];then filename=/etc/bashrc;elif [ -s /etc/bash.bashrc ];then filename=/etc/bash.bashrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename";
$pre_cmd{19865} = "lsattr /etc/group";
$pre_cmd{67958} = "redhat_count=0;
suse_count=0;
result=0;
telnet_status=`netstat -antp|grep -i listen|grep -c \":23\\>\"`;
if [[ \$telnet_status != 0 && -s /etc/issue ]];then cat /etc/issue;redhat_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi; 
if [[ \$telnet_status != 0 && -s /etc/issue.net ]];then cat /etc/issue.net;redhat_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi;
if [[ \$result == 1 && \$telnet_status == 1 ]];then echo \"telnet is running.telnet banner is not valid.telnet banner check result:false\";elif [ \$result == 1 ];then echo \"telnet is not running.telnet banner is not valid.telnet banner check result:true\";elif [ \$telnet_status == 1 ]; then echo \"telnet is running.telnet banner is valid.telnet banner check result:true\";else echo \"telnet is not running.telnet banner is valid.telnet banner check result:true\";fi;
unset redhat_count suse_count result ftp_status;";
$pre_cmd{54572} = "GID_MIN=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MIN\" | awk '{print \$2}'`;GID_MAX=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MAX\" | awk '{print \$2}'`;echo \"GID_MIN=\"\$GID_MIN;echo \"GID_MAX=\"\$GID_MAX;echo \"result:\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$4<='\$GID_MAX' && \$4>='\$GID_MIN'){print \$4}' | wc -l`;
cat /etc/passwd;
unset GID_MIN GID_MAX";
$pre_cmd{68755} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";if [ `grep -v \"^[[:space:]]*#\" \$FTPCONF|grep -i \"chroot_local_user=YES\"|wc -l` -eq 1 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true.\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false.\";fi;unset FTPCONF; }
function Check_pureftpd(){ cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";ChrootEveryone=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"ChrootEveryone\"|grep -i \"yes\"|wc -l`;AllowUserFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowUserFXP\"|grep -i \"no\"|wc -l`;AllowAnonymousFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowAnonymousFXP\"|grep -i \"no\"|wc -l`;PUREFTPD_NO=\$(expr \$ChrootEveryone + \$AllowUserFXP + \$AllowAnonymousFXP);if [ \$PUREFTPD_NO -eq 3 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true.\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false.\";fi;unset ChrootEveryone AllowUserFXP AllowAnonymousFXP PUREFTPD_NO; }
if [ \$FTPSTATUS = 0 ];then  echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;
unset FTPSTATUS;";
$pre_cmd{67926} = "ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -f /etc/motd ]];then echo \"sshd is running,banner is not null,check result:true\";elif [ \$ssh_status ];then echo \"sshd is running,banner is null,check result:false\";elif [ -f /etc/motd ];then echo \"sshd is not running,banner is not null,check result:true\";else echo \"sshd is not running,banner is null,check result:true\";fi;
unset ssh_status";
$pre_cmd{53222} = "cat /etc/hosts.allow";
$pre_cmd{52745} = "ret=`ps -ef | grep  nfs | grep -cv \"grep nfs\"`;
if [ \$ret -ge 1 ];then echo \"nfs:running\";else echo \"nfs:notrun\";fi";
$pre_cmd{46661} = "cat \"/etc/hosts.deny\"";
$pre_cmd{46463} = "cat /etc/hosts.allow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/^[[:space:]]*[^#]/)print \$3}'";
$pre_cmd{1} = "gsettings get org.gnome.desktop.screensaver idle-activation-enabled 2>/dev/null";
$pre_cmd{51974} = "unset ret;
ret=`find /usr/bin/chage /usr/bin/gpasswd /usr/bin/wall /usr/bin/chfn /usr/bin/chsh /usr/bin/newgrp /usr/bin/write /usr/sbin/usernetctl /usr/sbin/traceroute /bin/mount /bin/umount /bin/ping /sbin/netreport -type f -perm +6000 2>/dev/null`;
echo \$ret;
if [ -n \"\$ret\" ];then echo \"ret:exist invalid files\";else echo \"ret:all files valid\";fi;
unset ret;";
$pre_cmd{53116} = "if which chkrootkit>/dev/null 2>&1;then echo \"installed\";else echo \"no installed\";fi";
$pre_cmd{43009} = "cat \"/etc/host.conf\"";
$pre_cmd{52803} = "gconftool-2 -g /apps/gnome-screensaver/lock_enabled 2>/dev/null";
$pre_cmd{52042} = "gconftool-2 -g /apps/gnome-screensaver/idle_delay 2>/dev/null";
$pre_cmd{4} = "gsettings get org.gnome.desktop.session idle-delay 2>/dev/null";
$pre_cmd{53895} = "chkrootkit -q 2>/dev/null";
$pre_cmd{3} = "gsettings get org.gnome.desktop.screensaver lock-delay 2>/dev/null";
$pre_cmd{52013} = "gconftool-2 -g /apps/gnome-screensaver/mode 2>/dev/null";
$pre_cmd{2} = "gsettings get org.gnome.desktop.screensaver lock-enabled 2>/dev/null";
$pre_cmd{52704} = "gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled 2>/dev/null";
$pre_cmd{38719} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/system-auth ];then red_ret2=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so\"`;fi
if [ -s /etc/pam.d/common-auth ];then suse_ret=`cat /etc/pam.d/common-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/common-account ];then suse_ret2=`cat /etc/pam.d/common-account | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret3=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret4=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [[ -n \"\$red_ret\" && -n \"\$red_ret2\" ]];then echo \"redhat:valid\";elif [[ -n \"\$suse_ret\" && -n \"\$suse_ret2\" ]];then echo \"suse:valid\";elif [[ -n \"\$suse_ret3\" && -n \"suse_ret4\" ]];then echo \"suse2:valid\";else echo \"ret:not value\";fi";
$pre_cmd{61686} = "if [ -s /etc/pam.d/sshd ];then ret1=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/sshd ];then ret2=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so\"`;fi
if [[ -n \"\$ret1\" && -n \"\$ret2\" ]];then echo \"result:valid\";else echo \"result:invalue\";fi";
$pre_cmd{55303} = "if [ -f /etc/redhat-release ];then cat /etc/redhat-release;uname -a;echo \"result:yes\";elif [ -f /etc/SuSE-release ]; then cat /etc/SuSE-release;uname -a;echo \"result:yes\";fi";
$pre_cmd{53293} = "unset count status;
count=`chkconfig --list | grep -cE 'ntp|ntpd' `;
if [ \"\$count\" -ge 1 ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 1 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;elif [ -n \"\$count\" ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 2 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;else \"ntp:need install ntp service\";fi;
unset count status;";
$pre_cmd{49332} = "if [ -f /etc/ntp.conf ];then cat /etc/ntp.conf | grep -v \"^[[:space:]]*#\" | grep 'server' | grep -v \"127.127.1.0\" | grep -v \"127.0.0.1\";fi";
$pre_cmd{42740} = "cat /proc/sys/net/ipv4/ip_forward";
$pre_cmd{47813} = "if [ -f /etc/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/aliases 2>/dev/null;fi";
$pre_cmd{47217} = "if [ -f /etc/mail/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/mail/aliases;fi";
$pre_cmd{62700} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.send_redirects)`";
$pre_cmd{53459} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_redirects)`";
$pre_cmd{62051} = "echo \"result:\"`(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts)`";
$pre_cmd{62859} = "echo \"result:\"`(sysctl -n net.ipv4.ip_forward)`";
$pre_cmd{36563} = "ls -al /etc/group";
$pre_cmd{33824} = "cat /etc/shadow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/\\s*[^#]/)if(\$1==\"daemon\"||\$1==\"bin\"||\$1==\"sys\"||\$1==\"adm\"||\$1==\"lp\"||\$1==\"uucp\"||\$1==\"nuucp\"||\$1==\"smmsp\"){if(!match(\$2,\"!!\")&&\$2!=\"!\"&&\$2!=\"!*\"&&\$2!=\"*\"&&\$2!=\"x\")flag++}};END{if(flag==0)print \"ok\";else print \"no\"}'";
$pre_cmd{36950} = "ls -al /etc/shadow";
$pre_cmd{36239} = "ls -al /etc/passwd";
$pre_cmd{34023} = "awk -F: '{if(\$1==\"adm\"||\$1==\"lp\"||\$1==\"mail\"||\$1==\"uucp\"||\$1==\"operator\"||\$1==\"games\"||\$1==\"gopher\"||\$1==\"ftp\"||\$1==\"nobody\"||\$1==\"nobody4\"||\$1==\"noaccess\"||\$1==\"listen\"||\$1==\"webservd\"||\$1==\"rpm\"||\$1==\"dbus\"||\$1==\"avahi\"||\$1==\"mailnull\"||\$1==\"smmsp\"||\$1==\"nscd\"||\$1==\"vcsa\"||\$1==\"rpc\"||\$1==\"rpcuser\"||\$1==\"nfsnobody\"||\$1==\"sshd\"||\$1==\"pcap\"||\$1==\"ntp\"||\$1==\"haldaemon\"||\$1==\"distcache\"||\$1==\"apache\"||\$1==\"webalizer\"||\$1==\"squid\"||\$1==\"xfs\"||\$1==\"gdm\"||\$1==\"sabayon\"||\$1==\"named\"){if(\$2!=\"*\"&&\$2!~/!/)flag++}};END{if(flag==0)print \"ok\";else print \"no\"}' /etc/shadow";
$pre_cmd{48436} = "ps ax | grep -E 'chargen-dgram|daytime-stream|echo-streamklogin|tcpmux-server|chargen-stream|discard-dgram|eklogin|krb5-telnet|tftp|cvs|discard-stream|ekrb5-telnet|kshell|time-dgram|daytime-dgram|echo-dgram|gssftp|rsync|time-stream' | grep -v \"grep -E chargen-dgram|daytime-stream\"";
$pre_cmd{15803} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$pre_cmd{63398} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then ret_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"port(514)\"`;if [ -n \"\$ret_1\" ];then ret_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(logserver)\"`;fi;fi
if [ -n \"\$ret_2\" ];then echo \"ret:set\";else echo \"ret:none\";fi";
$pre_cmd{30294} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$pre_cmd{19149} = "lsattr /etc/passwd";
$pre_cmd{56697} = "ssh_banner=`cat /etc/ssh/sshd_config | grep -v '^[[:space:]]*#' | grep Banner|awk '{print \$2}'`;
ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -s \$ssh_banner ]];then echo \"sshd is running.sshd banner is not null.sshd banner check result:true\";elif [[ \$ssh_status != 0 ]];then echo \"sshd is running.sshd banner is null.sshd banner check result:false\";else echo \"sshd is not running.sshd banner check result:true\";fi;unset ssh_banner ssh_status";
$pre_cmd{19318} = "lsattr /etc/shadow";
$pre_cmd{19964} = "if [ -s /etc/gshadow ];then lsattr /etc/gshadow;else echo \"----i---------- \\etc\\gshadow\";fi";
$pre_cmd{62968} = "unset ret;
if [ -s /etc/rsyslog.conf ];then ret=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$pre_cmd{62242} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$pre_cmd{40003} = "unset ret;
if [ -s /etc/syslog.conf ];then ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$pre_cmd{63729} = "unset suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"level(err) or facility(kern) and level(debug) or facility(daemon) and level(notice)\"`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep 'file(\"/var/adm/msgs\")'`;if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(msgs)\"`;fi;fi;fi;if [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"suse:no value\";fi";
$pre_cmd{1049} = "file=\"/etc/login.defs\";if [ -s \${file} ];then ret=`cat \${file} | grep -v \"#\" | grep PASS_MAX_DAYS | awk -F ' ' '{print \$2}'`;fi
if [ 0 -ne \$ret  -a  90 -ge \$ret ];then echo \"PASS_MAX_DAYS ok\";else echo \"PASS_MAX_DAYS  fail\";fi";
$pre_cmd{3346} = "cat \"/etc/login.defs\"";
$pre_cmd{2024} = "cat \"/etc/login.defs\"";
$pre_cmd{5243} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};' | more";
$pre_cmd{15546} = "cat /etc/snmp/snmpd.conf  2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*private[[:space:]]*\"";
$pre_cmd{10348} = "unset num;
unset filename;
if [ -s /etc/csh.cshrc ];then filename=/etc/csh.cshrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename";
$pre_cmd{32468} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$pre_cmd{10924} = "unset num;
unset filename;
if [ -s /etc/profile ];then filename=/etc/profile;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename
";
$pre_cmd{53118} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_source_route)`";
$pre_cmd{32433} = "find / -maxdepth 3 -name hosts.equiv 2>/dev/null";
$pre_cmd{32465} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{43920} = "cat \"/etc/host.conf\"";
$pre_cmd{32529} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{32452} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd{4482} = "cat \"/etc/login.defs\"";
$pre_cmd{32078} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"\\s*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"\\s*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"\\s*#\";fi";
$pre_cmd{61272} = "ls -al /etc/rc1.d/";
$pre_cmd{6954} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$pre_cmd{61473} = "ls -al /etc/rc4.d/";
$pre_cmd{11825} = "ls -al /etc/security";
$pre_cmd{62106} = "chkconfig --list 2> /dev/null | grep \"^lpd\"";
$pre_cmd{62567} = "chkconfig --list 2> /dev/null | grep \"^nfslock\"";
$pre_cmd{62196} = "chkconfig --list 2> /dev/null | grep \"^time\"";
$pre_cmd{62890} = "chkconfig --list 2> /dev/null | grep \"^nfs\"";
$pre_cmd{32908} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"wu-ftp:valid\";else \"wu-ftp:invalid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$pre_cmd{33681} = "if (/etc/init.d/vsftpd status 2>/dev/null | grep \"running\");then if (cat /etc/vsftpd/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"vsftpd valid\";elif (cat /etc/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"vsftpd valid\";else echo  \"vsftpd invalid\";fi;else echo \"vsftpd is not running; vsftpd valid\";fi;";
$pre_cmd{32954} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/passwd| grep \"^[[:space:]]*[^#]\" | grep \"^[[:space:]]*ftp\");then echo \"wu-ftp:invalid\";else \"wu-ftp:valid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$pre_cmd{32952} = "if (/etc/init.d/vsftpd status 2>/dev/null | grep \"running\");then if [ -s /etc/vsftpd.conf ];then ret=`cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;elif [ -s /etc/vsftpd/vsftpd.conf ]; then ret=`cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;fi;else echo \"vsftp is not running,result-true\";fi
if [ -n \"\$ret\" ];then echo \"result-true\";else echo \"result-false\";fi";
$pre_cmd{62977} = "chkconfig --list 2> /dev/null | grep \"^ypbind\"";
$pre_cmd{62748} = "chkconfig --list 2> /dev/null | grep \"^chargen\"";
$pre_cmd{13192} = "tmp_result1=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*required[[:space:]]*pam_securetty.so[[:space:]]*\$\"`
tmp_result2=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*\\[[[:space:]]*user_unknown[[:space:]]*=[[:space:]]*ignore[[:space:]]*success[[:space:]]*=[[:space:]]*ok[[:space:]]*ignore[[:space:]]*=ignore[[:space:]]*default[[:space:]]*=[[:space:]]*bad[[:space:]]*\\][[:space:]]*pam_securetty.so[[:space:]]*\$\"`
if [ -n \"\${tmp_result1}\" -o -n \"\${tmp_result2}\" ];then echo \"true\";else echo \"false\";fi;";
$pre_cmd{27526} = "ps -ef | grep ssh";
$pre_cmd{29562} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$pre_cmd{63959} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then a_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"filter[[:space:]]*f_cron[[:space:]]*{[[:space:]]*facility(cron);[[:space:]]*};\" | wc -l `;else a_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then b_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination[[:space:]]*cron[[:space:]]*{[[:space:]]*file(\\\"*/var/log/cron\\\"*)[[:space:]]*;[[:space:]]*};\" | wc -l`;else b_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then c_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log[[:space:]]*{[[:space:]]*source(src);[[:space:]]*filter(f_cron);[[:space:]]*destination(cron);[[:space:]]*};\" | wc -l`;else c_i=1;fi
if [[ \"\$a_i\" -ge 1 && \"\$b_i\" -ge 1 && \"\$c_i\" -ge 1 ]];then echo \"result:true\";else echo \"result:false\";fi";
$pre_cmd{39656} = "(cat /var/log/pacct 1>/dev/null 2>&1 && echo exist) || echo not exist";
$pre_cmd{13945} = "cat \"/etc/ssh/sshd_config\"";
$pre_cmd{62617} = "ls -al /var/log/spooler";
$pre_cmd{62233} = "ls -al /var/log/boot.log";
$pre_cmd{62345} = "ls -al /var/log/mail";
$pre_cmd{62680} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$pre_cmd{11534} = "ls -al /etc/services";
$pre_cmd{61298} = "ls -al /etc/rc2.d/";
$pre_cmd{11017} = "ls -al /etc/passwd";
$pre_cmd{61245} = "ls -al /etc/rc0.d/";
$pre_cmd{11531} = "ls -al /etc/shadow";
$pre_cmd{61923} = "ls -al /etc/rc.d/init.d/";
$pre_cmd{11430} = "ls -al /etc/group";
$pre_cmd{61232} = "ls -al /tmp";
$pre_cmd{61858} = "ls -al /etc/rc3.d/";
$pre_cmd{61142} = "ls -al /etc/rc6.d/";
$pre_cmd{62820} = "chkconfig --list 2> /dev/null | grep \"^tftp\"";
$pre_cmd{62300} = "chkconfig --list 2> /dev/null | grep \"^klogin\"";
$pre_cmd{62699} = "chkconfig --list  2> /dev/null | grep \"^discard\"";
$pre_cmd{62162} = "chkconfig --list 2> /dev/null | grep \"^kshell\"";
$pre_cmd{62903} = "chkconfig --list 2> /dev/null | grep \"daytime\"";
$pre_cmd{62571} = "chkconfig --list 2> /dev/null | grep \"^echo\"";
$pre_cmd{62258} = "chkconfig --list 2> /dev/null | grep \"^sendmail\"";
$pre_cmd{62198} = "chkconfig --list  2> /dev/null | grep \"^ntalk\"";
$pre_cmd{62994} = "chkconfig --list 2> /dev/null | grep \"^ident\"";
$pre_cmd{62349} = "chkconfig --list 2> /dev/null | grep \"^printer\"";
$pre_cmd{62482} = "ls -al /var/log/localmessages";
$pre_cmd{32775} = "ls -al /var/log/messages";
$pre_cmd{37598} = "last | grep \"logged\"";
$pre_cmd{61798} = "ls -al /etc/rc5.d/";
$pre_cmd{11180} = "if [ -f /etc/xinetd.conf ];then stat -c %a  /etc/xinetd.conf ;elif [ -f /etc/inetd.conf ];then stat -c %a /etc/inetd.conf;fi";
$pre_cmd{62174} = "ls -al /tmp/nsfocus_mod_tmp";
$pre_cmd{62092} = "ls -al /var/log/maillog";
$pre_cmd{32648} = "ls -al /var/log/secure";
$pre_cmd{32371} = "ls -al /var/log/cron";
$pre_cmd{41242} = "unset red_ret suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog.conf ];then red_ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/rsyslog.conf ];then red_ret2=`cat /etc/rsyslog.conf | grep  -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(authpriv)\" | grep \"filter\" | grep \"f_secure\" | awk '{print \$2}'`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/secure\"`; if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;fi;fi;fi
if [ -n \"\$red_ret\" ];then echo \"redhat-suse:valid\";elif [ -n \"\$red_ret2\" ];then echo \"red-hat6:valid\";elif [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"ret:no value\";fi
unset red_ret suse_ret suse_ret2 suse_ret3;";
$pre_cmd{66622} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '{print \$2}')`;
up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '{print \$2}')`;
echo \"UIDMIN=\"\$up_uidmin;
echo \"UIDMAX=\"\$up_uidmax;
egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}';
echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`;
unset up_uidmin up_uidmax";

push(@array_pre_flag, 16822);
push(@array_pre_flag, 17298);
push(@array_pre_flag, 12448);
push(@array_pre_flag, 12848);
push(@array_pre_flag, 8119);
push(@array_pre_flag, 62795);
push(@array_pre_flag, 17483);
push(@array_pre_flag, 23934);
push(@array_pre_flag, 6);
push(@array_pre_flag, 35584);
push(@array_pre_flag, 62738);
push(@array_pre_flag, 27888);
push(@array_pre_flag, 63647);
push(@array_pre_flag, 18043);
push(@array_pre_flag, 18279);
push(@array_pre_flag, 64629);
push(@array_pre_flag, 15910);
push(@array_pre_flag, 5);
push(@array_pre_flag, 61940);
push(@array_pre_flag, 9109);
push(@array_pre_flag, 9652);
push(@array_pre_flag, 25992);
push(@array_pre_flag, 21560);
push(@array_pre_flag, 60395);
push(@array_pre_flag, 10436);
push(@array_pre_flag, 32629);
push(@array_pre_flag, 10890);
push(@array_pre_flag, 19865);
push(@array_pre_flag, 67958);
push(@array_pre_flag, 54572);
push(@array_pre_flag, 68755);
push(@array_pre_flag, 67926);
push(@array_pre_flag, 53222);
push(@array_pre_flag, 52745);
push(@array_pre_flag, 46661);
push(@array_pre_flag, 46463);
push(@array_pre_flag, 1);
push(@array_pre_flag, 51974);
push(@array_pre_flag, 53116);
push(@array_pre_flag, 43009);
push(@array_pre_flag, 52803);
push(@array_pre_flag, 52042);
push(@array_pre_flag, 4);
push(@array_pre_flag, 53895);
push(@array_pre_flag, 3);
push(@array_pre_flag, 52013);
push(@array_pre_flag, 2);
push(@array_pre_flag, 52704);
push(@array_pre_flag, 38719);
push(@array_pre_flag, 61686);
push(@array_pre_flag, 55303);
push(@array_pre_flag, 53293);
push(@array_pre_flag, 49332);
push(@array_pre_flag, 42740);
push(@array_pre_flag, 47813);
push(@array_pre_flag, 47217);
push(@array_pre_flag, 62700);
push(@array_pre_flag, 53459);
push(@array_pre_flag, 62051);
push(@array_pre_flag, 62859);
push(@array_pre_flag, 36563);
push(@array_pre_flag, 33824);
push(@array_pre_flag, 36950);
push(@array_pre_flag, 36239);
push(@array_pre_flag, 34023);
push(@array_pre_flag, 48436);
push(@array_pre_flag, 15803);
push(@array_pre_flag, 63398);
push(@array_pre_flag, 30294);
push(@array_pre_flag, 19149);
push(@array_pre_flag, 56697);
push(@array_pre_flag, 19318);
push(@array_pre_flag, 19964);
push(@array_pre_flag, 62968);
push(@array_pre_flag, 62242);
push(@array_pre_flag, 40003);
push(@array_pre_flag, 63729);
push(@array_pre_flag, 1049);
push(@array_pre_flag, 3346);
push(@array_pre_flag, 2024);
push(@array_pre_flag, 5243);
push(@array_pre_flag, 15546);
push(@array_pre_flag, 10348);
push(@array_pre_flag, 32468);
push(@array_pre_flag, 10924);
push(@array_pre_flag, 53118);
push(@array_pre_flag, 32433);
push(@array_pre_flag, 32465);
push(@array_pre_flag, 43920);
push(@array_pre_flag, 32529);
push(@array_pre_flag, 32452);
push(@array_pre_flag, 4482);
push(@array_pre_flag, 32078);
push(@array_pre_flag, 61272);
push(@array_pre_flag, 6954);
push(@array_pre_flag, 61473);
push(@array_pre_flag, 11825);
push(@array_pre_flag, 62106);
push(@array_pre_flag, 62567);
push(@array_pre_flag, 62196);
push(@array_pre_flag, 62890);
push(@array_pre_flag, 32908);
push(@array_pre_flag, 33681);
push(@array_pre_flag, 32954);
push(@array_pre_flag, 32952);
push(@array_pre_flag, 62977);
push(@array_pre_flag, 62748);
push(@array_pre_flag, 13192);
push(@array_pre_flag, 27526);
push(@array_pre_flag, 29562);
push(@array_pre_flag, 63959);
push(@array_pre_flag, 39656);
push(@array_pre_flag, 13945);
push(@array_pre_flag, 62617);
push(@array_pre_flag, 62233);
push(@array_pre_flag, 62345);
push(@array_pre_flag, 62680);
push(@array_pre_flag, 11534);
push(@array_pre_flag, 61298);
push(@array_pre_flag, 11017);
push(@array_pre_flag, 61245);
push(@array_pre_flag, 11531);
push(@array_pre_flag, 61923);
push(@array_pre_flag, 11430);
push(@array_pre_flag, 61232);
push(@array_pre_flag, 61858);
push(@array_pre_flag, 61142);
push(@array_pre_flag, 62820);
push(@array_pre_flag, 62300);
push(@array_pre_flag, 62699);
push(@array_pre_flag, 62162);
push(@array_pre_flag, 62903);
push(@array_pre_flag, 62571);
push(@array_pre_flag, 62258);
push(@array_pre_flag, 62198);
push(@array_pre_flag, 62994);
push(@array_pre_flag, 62349);
push(@array_pre_flag, 62482);
push(@array_pre_flag, 32775);
push(@array_pre_flag, 37598);
push(@array_pre_flag, 61798);
push(@array_pre_flag, 11180);
push(@array_pre_flag, 62174);
push(@array_pre_flag, 62092);
push(@array_pre_flag, 32648);
push(@array_pre_flag, 32371);
push(@array_pre_flag, 41242);
push(@array_pre_flag, 66622);

$pre_cmd1{16822} = "cat \"/etc/inittab\"";
$pre_cmd1{17298} = "find / -maxdepth 2 -type f -name hosts.equiv 2>/dev/null| grep -v -c -i \"find[[:space:]]*:\"";
$pre_cmd1{12448} = "cat \"/etc/security/limits.conf\"";
$pre_cmd1{12848} = "cat \"/etc/security/limits.conf\"";
$pre_cmd1{8119} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | grep -v \"export\" | sed 's/[^0-9]//g'
cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"export[[:space:]]*TMOUT[[:space:]]*=[[:space:]]*[0-9]*\" | sed 's/[^0-9]//g'";
$pre_cmd1{62795} = "chkconfig --list 2> /dev/null | grep \"^bootps\"";
$pre_cmd1{17483} = "find / -maxdepth 3 -type f -name .rhosts 2>/dev/null | grep -v -c -i \"find[[:space:]]*:\"";
$pre_cmd1{23934} = "(cat /etc/pam.d/su | grep pam_rootok | grep \"^[[:space:]]*[^#]\";cat /etc/pam.d/su | grep pam_wheel.so | grep \"^[[:space:]]*[^#]\") | awk '{ORS=\",\"}{print \$0}'";
$pre_cmd1{6} = "if [ -s /boot/grub/menu.lst ];then echo  '1';else echo '0';fi";
$pre_cmd1{35584} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/common-password ];then suse_ret=`cat /etc/pam.d/common-password | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*.*remember.*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret2=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"[[:space:]]*password[[:space:]]*sufficient[[:space:]]*pam_unix.so[[:space:]]*md5[[:space:]]*shadow[[:space:]]*nullok[[:space:]]*try_first_pass[[:space:]]*use_authtok[[:space:]]*\" | grep \"remember=5\"`;fi
if [ -n \"\$red_ret\" ];then echo \"redhat:valid\";elif [ -n \"\$suse_ret\" ]; then echo \"suse:valid\";elif [ -n \"\$suse_ret2\" ];then echo \"suse2:valid\";else echo \"ret:invalid\";fi";
$pre_cmd1{62738} = "unset ret_1 ret_2;
if [ -f /etc/ssh/sshd_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;elif [ -f /etc/ssh2/sshd2_config ];then ret_1=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"Protocol\" | grep \"1\"`;if [ -z \"\$ret_1\" ];then ret_2=`cat /etc/ssh/sshd_config | grep -v \"^[[:space:]]*#\" | grep \"PermitRootLogin\" | grep -E \"no|NO\"`;if [ -n \"\$ret_2\" ];then echo \"ret:valid\";else echo \"ret:PermitRootLogin invalid\";fi;else echo \"ret:Protocol invalid\";fi;else echo \"ret:valid\";fi
unset ret_1 ret_2;";
$pre_cmd1{27888} = "netstat -an | grep \":23\\b\"";
$pre_cmd1{63647} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$pre_cmd1{18043} = "cat \"/etc/profile\"";
$pre_cmd1{18279} = "cat /etc/profile | grep -v \"^[[:space:]]*#\" | grep \"HISTFILESIZE\" | awk -F= '{print \$2}'";
$pre_cmd1{64629} = "LANG=c;
find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;
echo \"result=\"`find /usr/bin -type f \\( -perm -04000 -o -perm -02000 \\) -exec ls -lg {} \\;|wc -l`;";
$pre_cmd1{15910} = "cat /etc/snmp/snmpd.conf 2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*public[[:space:]]*\" ";
$pre_cmd1{5} = "if [ -s /etc/lilo.conf ];then echo  '1';else echo '0';fi";
$pre_cmd1{61940} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`;
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;echo +++++++++vsftpd.conf+++++++++++++++++;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++vsftpd.conf end+++++++++++++;ls_recurse_enable=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"ls_recurse_enable=YES\"|wc -l`;local_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"local_umask=022\"|wc -l`;anon_umask=`cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep -i \"anon_umask=022\"|wc -l`;VSFTPD_NO=\$(expr \$ls_recurse_enable + \$local_umask + \$anon_umask);if [ \$VSFTPD_NO -eq 3 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false\";fi;unset FTPCONF VSFTPD_NO ls_recurse_enable local_umask anon_umask; }
function Check_pureftpd(){ echo +++++++++pure-ftpd.conf+++++++++++++++++;cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";echo +++++++++pure-ftpd.conf end+++++++++++++;if [ `cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"Umask\"|grep -i \"177:077\"|wc -l` == 1 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false\";fi; }
if [ \$FTPSTATUS = 0 ];then echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` != 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;
unset FTPSTATUS;";
$pre_cmd1{9109} = "if [ -s /etc/lilo.conf ];then cat /etc/lilo.conf | grep -v \"^[[:space:]]#\" | grep \"password\";fi";
$pre_cmd1{9652} = "cat \"/boot/grub/menu.lst\"";
$pre_cmd1{25992} = "cat /etc/login.defs | grep -v \"^[[:space:]]*#\" | grep -i \"^[[:space:]]*umask\"";
$pre_cmd1{21560} = "df -k";
$pre_cmd1{60395} = "unset syslogd_status syslogng_status rsyslogd_status LOGDIR;
syslogd_status=`ps -ef |grep ' syslogd '|grep -v \"grep\"|wc -l`;
syslogng_status=`ps -ef |grep \"/syslog-ng\"|grep -v \"grep /syslog-ng\"|wc -l`;
rsyslogd_status=`ps -ef | grep \"\\/rsyslogd \" | grep -v \"grep\" |wc -l`;
if [ \$syslogd_status != 0 ];then LOGDIR=`if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf| grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}';fi`;ls -l \$LOGDIR 2>/dev/null | grep  \"^-\" | cut -b 5-10;elif [ \$rsyslogd_status != 0 ];then LOGDIR=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" |sed '/^#/d' |sed '/^\$/d' |awk '((\$2!~/@/) && (\$2!~/*/) && (\$2!~/-/)) {print \$2}'`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;elif [[ \$syslogng_status != 0 ]];then LOGDIR=`cat /etc/syslog-ng/syslog-ng.conf|grep -v \"^[[:space:]]*#\"|grep \"^destination\"|grep file|cut -d\\\" -f2`;ls -l \$LOGDIR 2>/dev/null | grep \"^-\" | cut -b 5-10;else echo \"syslog is not running.\";fi;
unset syslogd_status syslogng_status rsyslogd_status LOGDIR;";
$pre_cmd1{10436} = "unset num;
unset filename;
if [ -s /etc/csh.login ];then filename=/etc/csh.login;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename
";
$pre_cmd1{32629} = "find / -maxdepth 3 -name .netrc 2>/dev/null";
$pre_cmd1{10890} = "unset num;
unset filename;
if [ -s /etc/bashrc ];then filename=/etc/bashrc;elif [ -s /etc/bash.bashrc ];then filename=/etc/bash.bashrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename";
$pre_cmd1{19865} = "lsattr /etc/group";
$pre_cmd1{67958} = "redhat_count=0;
suse_count=0;
result=0;
telnet_status=`netstat -antp|grep -i listen|grep -c \":23\\>\"`;
if [[ \$telnet_status != 0 && -s /etc/issue ]];then cat /etc/issue;redhat_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi; 
if [[ \$telnet_status != 0 && -s /etc/issue.net ]];then cat /etc/issue.net;redhat_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;suse_count=`cat /etc/issue.net | grep \"Red Hat Enterprise\" | wc -l`;fi;
if [[ \$redhat_count == 1 || \$suse_count == 1 ]];then result=1;fi;
if [[ \$result == 1 && \$telnet_status == 1 ]];then echo \"telnet is running.telnet banner is not valid.telnet banner check result:false\";elif [ \$result == 1 ];then echo \"telnet is not running.telnet banner is not valid.telnet banner check result:true\";elif [ \$telnet_status == 1 ]; then echo \"telnet is running.telnet banner is valid.telnet banner check result:true\";else echo \"telnet is not running.telnet banner is valid.telnet banner check result:true\";fi;
unset redhat_count suse_count result ftp_status;";
$pre_cmd1{54572} = "GID_MIN=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MIN\" | awk '{print \$2}'`;GID_MAX=`grep -v \"^[[:space:]]*#\" /etc/login.defs | grep \"^GID_MAX\" | awk '{print \$2}'`;echo \"GID_MIN=\"\$GID_MIN;echo \"GID_MAX=\"\$GID_MAX;echo \"result:\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$4<='\$GID_MAX' && \$4>='\$GID_MIN'){print \$4}' | wc -l`;
cat /etc/passwd;
unset GID_MIN GID_MAX";
$pre_cmd1{68755} = "#!/bin/bash
FTPSTATUS=`netstat -antp|grep -i \"listen\"|grep \":21\\>\"|wc -l`
function Check_vsftpd(){ if [ -f /etc/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd.conf\";elif [ -f /etc/vsftpd/vsftpd.conf ];then FTPCONF=\"/etc/vsftpd/vsftpd.conf\";fi;cat \$FTPCONF|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";if [ `grep -v \"^[[:space:]]*#\" \$FTPCONF|grep -i \"chroot_local_user=YES\"|wc -l` -eq 1 ];then  echo \"vsftpd is running.\$FTPCONF is recommended.FTP check result:true.\";else  echo \"vsftpd is running.\$FTPCONF is not recommended.FTP check result:false.\";fi;unset FTPCONF; }
function Check_pureftpd(){ cat /etc/pure-ftpd/pure-ftpd.conf|egrep -v \"^[[:space:]]*#|^[[:space:]]*\$\";ChrootEveryone=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"ChrootEveryone\"|grep -i \"yes\"|wc -l`;AllowUserFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowUserFXP\"|grep -i \"no\"|wc -l`;AllowAnonymousFXP=`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -i \"AllowAnonymousFXP\"|grep -i \"no\"|wc -l`;PUREFTPD_NO=\$(expr \$ChrootEveryone + \$AllowUserFXP + \$AllowAnonymousFXP);if [ \$PUREFTPD_NO -eq 3 ];then echo \"pure-ftpd is running.pure-ftpd.conf is recommended.FTP check result:true.\";else echo \"pure-ftpd is running.pure-ftpd.conf is not recommended.FTP check result:false.\";fi;unset ChrootEveryone AllowUserFXP AllowAnonymousFXP PUREFTPD_NO; }
if [ \$FTPSTATUS = 0 ];then  echo \"FTP is not running.FTP check result:true.\";elif ([ `ps -ef|grep vsftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_vsftpd;elif ([ `ps -ef|grep pure-ftpd|grep -v \"grep\"|wc -l` -ne 0 ]);then Check_pureftpd;else echo \"ftp is running,FTP check result:true\";fi;
unset FTPSTATUS;";
$pre_cmd1{67926} = "ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -f /etc/motd ]];then echo \"sshd is running,banner is not null,check result:true\";elif [ \$ssh_status ];then echo \"sshd is running,banner is null,check result:false\";elif [ -f /etc/motd ];then echo \"sshd is not running,banner is not null,check result:true\";else echo \"sshd is not running,banner is null,check result:true\";fi;
unset ssh_status";
$pre_cmd1{53222} = "cat /etc/hosts.allow";
$pre_cmd1{52745} = "ret=`ps -ef | grep  nfs | grep -cv \"grep nfs\"`;
if [ \$ret -ge 1 ];then echo \"nfs:running\";else echo \"nfs:notrun\";fi";
$pre_cmd1{46661} = "cat \"/etc/hosts.deny\"";
$pre_cmd1{46463} = "cat /etc/hosts.allow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/^[[:space:]]*[^#]/)print \$3}'";
$pre_cmd1{1} = "gsettings get org.gnome.desktop.screensaver idle-activation-enabled 2>/dev/null";
$pre_cmd1{51974} = "unset ret;
ret=`find /usr/bin/chage /usr/bin/gpasswd /usr/bin/wall /usr/bin/chfn /usr/bin/chsh /usr/bin/newgrp /usr/bin/write /usr/sbin/usernetctl /usr/sbin/traceroute /bin/mount /bin/umount /bin/ping /sbin/netreport -type f -perm +6000 2>/dev/null`;
echo \$ret;
if [ -n \"\$ret\" ];then echo \"ret:exist invalid files\";else echo \"ret:all files valid\";fi;
unset ret;";
$pre_cmd1{53116} = "if which chkrootkit>/dev/null 2>&1;then echo \"installed\";else echo \"no installed\";fi";
$pre_cmd1{43009} = "cat \"/etc/host.conf\"";
$pre_cmd1{52803} = "gconftool-2 -g /apps/gnome-screensaver/lock_enabled 2>/dev/null";
$pre_cmd1{52042} = "gconftool-2 -g /apps/gnome-screensaver/idle_delay 2>/dev/null";
$pre_cmd1{4} = "gsettings get org.gnome.desktop.session idle-delay 2>/dev/null";
$pre_cmd1{53895} = "chkrootkit -q 2>/dev/null";
$pre_cmd1{3} = "gsettings get org.gnome.desktop.screensaver lock-delay 2>/dev/null";
$pre_cmd1{52013} = "gconftool-2 -g /apps/gnome-screensaver/mode 2>/dev/null";
$pre_cmd1{2} = "gsettings get org.gnome.desktop.screensaver lock-enabled 2>/dev/null";
$pre_cmd1{52704} = "gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled 2>/dev/null";
$pre_cmd1{38719} = "if [ -s /etc/pam.d/system-auth ];then red_ret=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/system-auth ];then red_ret2=`cat /etc/pam.d/system-auth | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[0-9]*.so\"`;fi
if [ -s /etc/pam.d/common-auth ];then suse_ret=`cat /etc/pam.d/common-auth | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/common-account ];then suse_ret2=`cat /etc/pam.d/common-account | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret3=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/passwd ];then suse_ret4=`cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally.so\"`;fi
if [[ -n \"\$red_ret\" && -n \"\$red_ret2\" ]];then echo \"redhat:valid\";elif [[ -n \"\$suse_ret\" && -n \"\$suse_ret2\" ]];then echo \"suse:valid\";elif [[ -n \"\$suse_ret3\" && -n \"suse_ret4\" ]];then echo \"suse2:valid\";else echo \"ret:not value\";fi";
$pre_cmd1{61686} = "if [ -s /etc/pam.d/sshd ];then ret1=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"auth[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so[[:space:]]*.*deny=[0-9]*[[:space:]]*.*unlock_time=[0-9]*\"`;fi
if [ -s /etc/pam.d/sshd ];then ret2=`cat /etc/pam.d/sshd  | grep -v \"^[[:space:]]*#\" | grep \"account[[:space:]]*required[[:space:]]*pam_tally[2]\\?.so\"`;fi
if [[ -n \"\$ret1\" && -n \"\$ret2\" ]];then echo \"result:valid\";else echo \"result:invalue\";fi";
$pre_cmd1{55303} = "if [ -f /etc/redhat-release ];then cat /etc/redhat-release;uname -a;echo \"result:yes\";elif [ -f /etc/SuSE-release ]; then cat /etc/SuSE-release;uname -a;echo \"result:yes\";fi";
$pre_cmd1{53293} = "unset count status;
count=`chkconfig --list | grep -cE 'ntp|ntpd' `;
if [ \"\$count\" -ge 1 ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 1 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;elif [ -n \"\$count\" ];then status=`ps aux | grep -E 'ntp |ntpd ' | grep -cv \"grep -E ntp |ntpd \"`;if [ \"\$status\" -ge 2 ];then echo \"ntp:start\";else echo \"ntp:stop\";fi;else \"ntp:need install ntp service\";fi;
unset count status;";
$pre_cmd1{49332} = "if [ -f /etc/ntp.conf ];then cat /etc/ntp.conf | grep -v \"^[[:space:]]*#\" | grep 'server' | grep -v \"127.127.1.0\" | grep -v \"127.0.0.1\";fi";
$pre_cmd1{42740} = "cat /proc/sys/net/ipv4/ip_forward";
$pre_cmd1{47813} = "if [ -f /etc/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/aliases 2>/dev/null;fi";
$pre_cmd1{47217} = "if [ -f /etc/mail/aliases ];then awk -F: '{if(\$1~/^[[:space:]]*[^#]/)if(\$1==\"games\"||\$1==\"ingres\"||\$1==\"system\"||\$1==\"toor\"||\$1==\"uucp\"||\$1==\"manager\"||\$1==\"dumper\"||\$1==\"operator\"||\$1==\"decode\"||\$1==\"root\")flag++};END{if(flag==0)print\"ok\";else print\"no\"}' /etc/mail/aliases;fi";
$pre_cmd1{62700} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.send_redirects)`";
$pre_cmd1{53459} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_redirects)`";
$pre_cmd1{62051} = "echo \"result:\"`(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts)`";
$pre_cmd1{62859} = "echo \"result:\"`(sysctl -n net.ipv4.ip_forward)`";
$pre_cmd1{36563} = "ls -al /etc/group";
$pre_cmd1{33824} = "cat /etc/shadow | awk '{FS=\":\";ORS=\" \"}{if(\$1~/\\s*[^#]/)if(\$1==\"daemon\"||\$1==\"bin\"||\$1==\"sys\"||\$1==\"adm\"||\$1==\"lp\"||\$1==\"uucp\"||\$1==\"nuucp\"||\$1==\"smmsp\"){if(!match(\$2,\"!!\")&&\$2!=\"!\"&&\$2!=\"!*\"&&\$2!=\"*\"&&\$2!=\"x\")flag++}};END{if(flag==0)print \"ok\";else print \"no\"}'";
$pre_cmd1{36950} = "ls -al /etc/shadow";
$pre_cmd1{36239} = "ls -al /etc/passwd";
$pre_cmd1{34023} = "awk -F: '{if(\$1==\"adm\"||\$1==\"lp\"||\$1==\"mail\"||\$1==\"uucp\"||\$1==\"operator\"||\$1==\"games\"||\$1==\"gopher\"||\$1==\"ftp\"||\$1==\"nobody\"||\$1==\"nobody4\"||\$1==\"noaccess\"||\$1==\"listen\"||\$1==\"webservd\"||\$1==\"rpm\"||\$1==\"dbus\"||\$1==\"avahi\"||\$1==\"mailnull\"||\$1==\"smmsp\"||\$1==\"nscd\"||\$1==\"vcsa\"||\$1==\"rpc\"||\$1==\"rpcuser\"||\$1==\"nfsnobody\"||\$1==\"sshd\"||\$1==\"pcap\"||\$1==\"ntp\"||\$1==\"haldaemon\"||\$1==\"distcache\"||\$1==\"apache\"||\$1==\"webalizer\"||\$1==\"squid\"||\$1==\"xfs\"||\$1==\"gdm\"||\$1==\"sabayon\"||\$1==\"named\"){if(\$2!=\"*\"&&\$2!~/!/)flag++}};END{if(flag==0)print \"ok\";else print \"no\"}' /etc/shadow";
$pre_cmd1{48436} = "ps ax | grep -E 'chargen-dgram|daytime-stream|echo-streamklogin|tcpmux-server|chargen-stream|discard-dgram|eklogin|krb5-telnet|tftp|cvs|discard-stream|ekrb5-telnet|kshell|time-dgram|daytime-dgram|echo-dgram|gssftp|rsync|time-stream' | grep -v \"grep -E chargen-dgram|daytime-stream\"";
$pre_cmd1{15803} = "if [ -f /etc/snmp/snmpd.conf ];then echo \"yes\";else echo \"no\";fi";
$pre_cmd1{63398} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then ret_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"port(514)\"`;if [ -n \"\$ret_1\" ];then ret_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(logserver)\"`;fi;fi
if [ -n \"\$ret_2\" ];then echo \"ret:set\";else echo \"ret:none\";fi";
$pre_cmd1{30294} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$pre_cmd1{19149} = "lsattr /etc/passwd";
$pre_cmd1{56697} = "ssh_banner=`cat /etc/ssh/sshd_config | grep -v '^[[:space:]]*#' | grep Banner|awk '{print \$2}'`;
ssh_status=`netstat -antp|grep -i listen|grep \":22\\>\"|wc -l`;
if [[ \$ssh_status != 0 && -s \$ssh_banner ]];then echo \"sshd is running.sshd banner is not null.sshd banner check result:true\";elif [[ \$ssh_status != 0 ]];then echo \"sshd is running.sshd banner is null.sshd banner check result:false\";else echo \"sshd is not running.sshd banner check result:true\";fi;unset ssh_banner ssh_status";
$pre_cmd1{19318} = "lsattr /etc/shadow";
$pre_cmd1{19964} = "if [ -s /etc/gshadow ];then lsattr /etc/gshadow;else echo \"----i---------- \\etc\\gshadow\";fi";
$pre_cmd1{62968} = "unset ret;
if [ -s /etc/rsyslog.conf ];then ret=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$pre_cmd1{62242} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';fi";
$pre_cmd1{40003} = "unset ret;
if [ -s /etc/syslog.conf ];then ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"\\*\\.err;kern\\.debug;daemon\\.notice[[:space:]]*\"|grep \"/var/adm/messages\"`;fi
if [ -n \"\$ret\" ];then echo \"red:valid\";else echo \"red-suse:no value\";fi";
$pre_cmd1{63729} = "unset suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"level(err) or facility(kern) and level(debug) or facility(daemon) and level(notice)\"`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep 'file(\"/var/adm/msgs\")'`;if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(msgs)\"`;fi;fi;fi;if [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"suse:no value\";fi";
$pre_cmd1{1049} = "file=\"/etc/login.defs\";if [ -s \${file} ];then ret=`cat \${file} | grep -v \"#\" | grep PASS_MAX_DAYS | awk -F ' ' '{print \$2}'`;fi
if [ 0 -ne \$ret  -a  90 -ge \$ret ];then echo \"PASS_MAX_DAYS ok\";else echo \"PASS_MAX_DAYS  fail\";fi";
$pre_cmd1{3346} = "cat \"/etc/login.defs\"";
$pre_cmd1{2024} = "cat \"/etc/login.defs\"";
$pre_cmd1{5243} = "cat /etc/shadow | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$2==\"\")print \$1};' | more";
$pre_cmd1{15546} = "cat /etc/snmp/snmpd.conf  2>/dev/null | grep -v \"^[[:space:]]*#\" | grep -c \"[[:space:]]*private[[:space:]]*\"";
$pre_cmd1{10348} = "unset num;
unset filename;
if [ -s /etc/csh.cshrc ];then filename=/etc/csh.cshrc;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename";
$pre_cmd1{32468} = "find / -maxdepth 3 -name .rhosts 2>/dev/null";
$pre_cmd1{10924} = "unset num;
unset filename;
if [ -s /etc/profile ];then filename=/etc/profile;fi;
function checkusrumask(){ if [ -f \$filename ];then num=`cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask|wc -l`;if [ \$num -gt 0 ];then cat \$filename |grep -v \"^[[:space:]]*#\" |grep umask | while read line;do myvar=`echo \$line|awk '{print \$2}'`;if [[ \"\$myvar\" != 077 ]];then echo \"false-substandered\";fi;done;else echo \"false-not configured\";fi;fi; };
checkusrumask;unset num; unset filename
";
$pre_cmd1{53118} = "echo \"result:\"`(sysctl -n net.ipv4.conf.all.accept_source_route)`";
$pre_cmd1{32433} = "find / -maxdepth 3 -name hosts.equiv 2>/dev/null";
$pre_cmd1{32465} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd1{43920} = "cat \"/etc/host.conf\"";
$pre_cmd1{32529} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd1{32452} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"^[[:space:]]*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"^[[:space:]]*#\";fi";
$pre_cmd1{4482} = "cat \"/etc/login.defs\"";
$pre_cmd1{32078} = "if [ -s /etc/pam.d/system-auth ];then cat /etc/pam.d/system-auth|grep -v \"\\s*#\";elif [ -s /etc/pam.d/common-password ];then cat /etc/pam.d/common-password|grep -v \"\\s*#\";elif [ -s /etc/pam.d/passwd ];then cat /etc/pam.d/passwd | grep -v \"\\s*#\";fi";
$pre_cmd1{61272} = "ls -al /etc/rc1.d/";
$pre_cmd1{6954} = "cat /etc/passwd | awk 'BEGIN{FS=\":\";ORS=\",\"}{if(\$1~/^[[:space:]]*[^#]/)if(\$1!=\"root\")if(\$3==\"0\")print \$1}'";
$pre_cmd1{61473} = "ls -al /etc/rc4.d/";
$pre_cmd1{11825} = "ls -al /etc/security";
$pre_cmd1{62106} = "chkconfig --list 2> /dev/null | grep \"^lpd\"";
$pre_cmd1{62567} = "chkconfig --list 2> /dev/null | grep \"^nfslock\"";
$pre_cmd1{62196} = "chkconfig --list 2> /dev/null | grep \"^time\"";
$pre_cmd1{62890} = "chkconfig --list 2> /dev/null | grep \"^nfs\"";
$pre_cmd1{32908} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"wu-ftp:valid\";else \"wu-ftp:invalid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$pre_cmd1{33681} = "if (/etc/init.d/vsftpd status 2>/dev/null | grep \"running\");then if (cat /etc/vsftpd/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"vsftpd valid\";elif (cat /etc/ftpusers 2>/dev/null | grep \"^[[:space:]]*[^#]\" | grep \"\\broot\\b\");then echo \"vsftpd valid\";else echo  \"vsftpd invalid\";fi;else echo \"vsftpd is not running; vsftpd valid\";fi;";
$pre_cmd1{32954} = "wu_status=`rpm -q wu-ftpd 2>/dev/null | grep \"^wu-ftpd\"`;
wu_status2=`netstat -antp|grep -i \"listen\"|grep -c \":21\\>\"`;
if [ -n \"\$wu_status\" ];then if [ -n \"\$wu_status2\" ];then if (cat /etc/passwd| grep \"^[[:space:]]*[^#]\" | grep \"^[[:space:]]*ftp\");then echo \"wu-ftp:invalid\";else \"wu-ftp:valid\";fi;else echo \"wu-ftpd:valid\";fi;else echo \"wu-ftpd:valid\";fi";
$pre_cmd1{32952} = "if (/etc/init.d/vsftpd status 2>/dev/null | grep \"running\");then if [ -s /etc/vsftpd.conf ];then ret=`cat /etc/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;elif [ -s /etc/vsftpd/vsftpd.conf ]; then ret=`cat /etc/vsftpd/vsftpd.conf | grep -v \"^[[:space:]]*#\" | grep \"anonymous_enable=NO\"`;fi;else echo \"vsftp is not running,result-true\";fi
if [ -n \"\$ret\" ];then echo \"result-true\";else echo \"result-false\";fi";
$pre_cmd1{62977} = "chkconfig --list 2> /dev/null | grep \"^ypbind\"";
$pre_cmd1{62748} = "chkconfig --list 2> /dev/null | grep \"^chargen\"";
$pre_cmd1{13192} = "tmp_result1=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*required[[:space:]]*pam_securetty.so[[:space:]]*\$\"`
tmp_result2=`cat /etc/pam.d/login |grep -v \"^[[:space:]]*#\" |egrep \"^[[:space:]]*auth[[:space:]]*\\[[[:space:]]*user_unknown[[:space:]]*=[[:space:]]*ignore[[:space:]]*success[[:space:]]*=[[:space:]]*ok[[:space:]]*ignore[[:space:]]*=ignore[[:space:]]*default[[:space:]]*=[[:space:]]*bad[[:space:]]*\\][[:space:]]*pam_securetty.so[[:space:]]*\$\"`
if [ -n \"\${tmp_result1}\" -o -n \"\${tmp_result2}\" ];then echo \"true\";else echo \"false\";fi;";
$pre_cmd1{27526} = "ps -ef | grep ssh";
$pre_cmd1{29562} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$pre_cmd1{63959} = "if [ -s /etc/syslog-ng/syslog-ng.conf ];then a_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"filter[[:space:]]*f_cron[[:space:]]*{[[:space:]]*facility(cron);[[:space:]]*};\" | wc -l `;else a_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then b_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination[[:space:]]*cron[[:space:]]*{[[:space:]]*file(\\\"*/var/log/cron\\\"*)[[:space:]]*;[[:space:]]*};\" | wc -l`;else b_i=1;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then c_i=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log[[:space:]]*{[[:space:]]*source(src);[[:space:]]*filter(f_cron);[[:space:]]*destination(cron);[[:space:]]*};\" | wc -l`;else c_i=1;fi
if [[ \"\$a_i\" -ge 1 && \"\$b_i\" -ge 1 && \"\$c_i\" -ge 1 ]];then echo \"result:true\";else echo \"result:false\";fi";
$pre_cmd1{39656} = "(cat /var/log/pacct 1>/dev/null 2>&1 && echo exist) || echo not exist";
$pre_cmd1{13945} = "cat \"/etc/ssh/sshd_config\"";
$pre_cmd1{62617} = "ls -al /var/log/spooler";
$pre_cmd1{62233} = "ls -al /var/log/boot.log";
$pre_cmd1{62345} = "ls -al /var/log/mail";
$pre_cmd1{62680} = "if [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron\\.\\*[[:space:]]*\" | grep \"/var/log/cron\";fi";
$pre_cmd1{11534} = "ls -al /etc/services";
$pre_cmd1{61298} = "ls -al /etc/rc2.d/";
$pre_cmd1{11017} = "ls -al /etc/passwd";
$pre_cmd1{61245} = "ls -al /etc/rc0.d/";
$pre_cmd1{11531} = "ls -al /etc/shadow";
$pre_cmd1{61923} = "ls -al /etc/rc.d/init.d/";
$pre_cmd1{11430} = "ls -al /etc/group";
$pre_cmd1{61232} = "ls -al /tmp";
$pre_cmd1{61858} = "ls -al /etc/rc3.d/";
$pre_cmd1{61142} = "ls -al /etc/rc6.d/";
$pre_cmd1{62820} = "chkconfig --list 2> /dev/null | grep \"^tftp\"";
$pre_cmd1{62300} = "chkconfig --list 2> /dev/null | grep \"^klogin\"";
$pre_cmd1{62699} = "chkconfig --list  2> /dev/null | grep \"^discard\"";
$pre_cmd1{62162} = "chkconfig --list 2> /dev/null | grep \"^kshell\"";
$pre_cmd1{62903} = "chkconfig --list 2> /dev/null | grep \"daytime\"";
$pre_cmd1{62571} = "chkconfig --list 2> /dev/null | grep \"^echo\"";
$pre_cmd1{62258} = "chkconfig --list 2> /dev/null | grep \"^sendmail\"";
$pre_cmd1{62198} = "chkconfig --list  2> /dev/null | grep \"^ntalk\"";
$pre_cmd1{62994} = "chkconfig --list 2> /dev/null | grep \"^ident\"";
$pre_cmd1{62349} = "chkconfig --list 2> /dev/null | grep \"^printer\"";
$pre_cmd1{62482} = "ls -al /var/log/localmessages";
$pre_cmd1{32775} = "ls -al /var/log/messages";
$pre_cmd1{37598} = "last | grep \"logged\"";
$pre_cmd1{61798} = "ls -al /etc/rc5.d/";
$pre_cmd1{11180} = "if [ -f /etc/xinetd.conf ];then stat -c %a  /etc/xinetd.conf ;elif [ -f /etc/inetd.conf ];then stat -c %a /etc/inetd.conf;fi";
$pre_cmd1{62174} = "ls -al /tmp/nsfocus_mod_tmp";
$pre_cmd1{62092} = "ls -al /var/log/maillog";
$pre_cmd1{32648} = "ls -al /var/log/secure";
$pre_cmd1{32371} = "ls -al /var/log/cron";
$pre_cmd1{41242} = "unset red_ret suse_ret suse_ret2 suse_ret3;
if [ -s /etc/syslog.conf ];then red_ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/rsyslog.conf ];then red_ret2=`cat /etc/rsyslog.conf | grep  -v \"^[[:space:]]*#\" | grep \"authpriv.\\*[[:space:]]*.*\"`;fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(authpriv)\" | grep \"filter\" | grep \"f_secure\" | awk '{print \$2}'`;if [ -n \"\$suse_ret\" ];then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/secure\"`; if [ -n \"\$suse_ret2\" ];then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;fi;fi;fi
if [ -n \"\$red_ret\" ];then echo \"redhat-suse:valid\";elif [ -n \"\$red_ret2\" ];then echo \"red-hat6:valid\";elif [ -n \"\$suse_ret3\" ];then echo \"suse:valid\";else echo \"ret:no value\";fi
unset red_ret suse_ret suse_ret2 suse_ret3;";
$pre_cmd1{66622} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '{print \$2}')`;
up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '{print \$2}')`;
echo \"UIDMIN=\"\$up_uidmin;
echo \"UIDMAX=\"\$up_uidmax;
egrep -v \"oracle|sybase|postgres\" /etc/passwd | awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}';
echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`;
unset up_uidmin up_uidmax";

# 处理附录检查项中的执行命令

$appendix_cmd{9} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | head -300;elif [ -f /etc/syslog-ng/syslog-ng.conf ];then cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\"  | head -300;elif [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\"  | head -300;fi";$appendix_cmd{22} = "version=`lsb_release -a 2>/dev/null | grep \"Description\" | awk -F: '{print \$2}'`;if [ -n \"\$version\" ];then echo \$version;else if [ -z \"\$version\" ]; then echo \"\";else cat /etc/SuSE-release | grep -v \"VERSION\" | grep -v \"PATCHLEVEL\";fi;fi";$appendix_cmd{5} = "cat  /etc/securetty 2>/dev/null | head -300";$appendix_cmd{20} = "cat /etc/ftpaccess 2>/dev/null | grep -v \"^[[:space:]]*#\" | head -300";$appendix_cmd{2} = "cat  /etc/group 2>/dev/null | head -300";$appendix_cmd{7} = "ifconfig -a 2>/dev/null";$appendix_cmd{21} = "rpm -qa | head -100";$appendix_cmd{17} = "cat /etc/vsftpd/chroot_list 2>/dev/null | grep \"^[[:space:]]*[^#]\" | head -300";$appendix_cmd{10} = "df -m 2>/dev/null";$appendix_cmd{6} = "chkconfig --list | head -50";$appendix_cmd{3} = "cat  /etc/shadow 2>/dev/null | head -300";$appendix_cmd{14} = "netstat -anp 2>/dev/null | head -300";$appendix_cmd{4} = "if [ -f /etc/shadow ];then lsattr /etc/shadow 2>/dev/null;fi;
if [ -f /etc/gshadow ];then lsattr /etc/group 2>/dev/null;fi;
if [ -f /etc/passwd ];then lsattr /etc/passwd 2>/dev/null;fi";$appendix_cmd{1} = "cat /etc/passwd 2>/dev/null | head -300";$appendix_cmd{11} = "lastb -100 2>/dev/null";$appendix_cmd{15} = "ps -ef | grep -v \"\\.sh\" | grep -v \"\\.pl\"";$appendix_cmd{0} = "uname -a 2>/dev/null";$appendix_cmd{8} = "last -100 2>/dev/null";$appendix_cmd{13} = "rm -v /tmp/NSF{nsf_tm}_nsfocus_grub_tmp";$appendix_cmd{19} = "cat /etc/ftpaccess 2>/dev/null | grep \"^[[:space:]]*banner[[:space:]]*\\/.*\" | awk '{print \$2}' | while read user; do cat \$user;done | grep -v \"^[[:space:]]*#\" | head -300";$appendix_cmd{12} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";$appendix_cmd{16} = "if [ -f /etc/vsftpd.conf ];then cat /etc/vsftpd.conf |grep -v ^#|grep ftpd_banner;elif [ -f /etc/vsftpd/vsftpd.conf ];then cat /etc/vsftpd/vsftpd.conf |grep -v ^#|grep ftpd_banner;fi";
push(@array_appendix_flag, 9);
push(@array_appendix_flag, 22);
push(@array_appendix_flag, 5);
push(@array_appendix_flag, 20);
push(@array_appendix_flag, 2);
push(@array_appendix_flag, 7);
push(@array_appendix_flag, 21);
push(@array_appendix_flag, 17);
push(@array_appendix_flag, 10);
push(@array_appendix_flag, 6);
push(@array_appendix_flag, 3);
push(@array_appendix_flag, 14);
push(@array_appendix_flag, 4);
push(@array_appendix_flag, 1);
push(@array_appendix_flag, 11);
push(@array_appendix_flag, 15);
push(@array_appendix_flag, 0);
push(@array_appendix_flag, 8);
push(@array_appendix_flag, 13);
push(@array_appendix_flag, 19);
push(@array_appendix_flag, 12);
push(@array_appendix_flag, 16);

$appendix_cmd1{9} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | head -300;elif [ -f /etc/syslog-ng/syslog-ng.conf ];then cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\"  | head -300;elif [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\"  | head -300;fi";$appendix_cmd1{22} = "version=`lsb_release -a 2>/dev/null | grep \"Description\" | awk -F: '{print \$2}'`;if [ -n \"\$version\" ];then echo \$version;else if [ -z \"\$version\" ]; then echo \"\";else cat /etc/SuSE-release | grep -v \"VERSION\" | grep -v \"PATCHLEVEL\";fi;fi";$appendix_cmd1{5} = "cat  /etc/securetty 2>/dev/null | head -300";$appendix_cmd1{20} = "cat /etc/ftpaccess 2>/dev/null | grep -v \"^[[:space:]]*#\" | head -300";$appendix_cmd1{2} = "cat  /etc/group 2>/dev/null | head -300";$appendix_cmd1{7} = "ifconfig -a 2>/dev/null";$appendix_cmd1{21} = "rpm -qa | head -100";$appendix_cmd1{17} = "cat /etc/vsftpd/chroot_list 2>/dev/null | grep \"^[[:space:]]*[^#]\" | head -300";$appendix_cmd1{10} = "df -m 2>/dev/null";$appendix_cmd1{6} = "chkconfig --list | head -50";$appendix_cmd1{3} = "cat  /etc/shadow 2>/dev/null | head -300";$appendix_cmd1{14} = "netstat -anp 2>/dev/null | head -300";$appendix_cmd1{4} = "if [ -f /etc/shadow ];then lsattr /etc/shadow 2>/dev/null;fi;
if [ -f /etc/gshadow ];then lsattr /etc/group 2>/dev/null;fi;
if [ -f /etc/passwd ];then lsattr /etc/passwd 2>/dev/null;fi";$appendix_cmd1{1} = "cat /etc/passwd 2>/dev/null | head -300";$appendix_cmd1{11} = "lastb -100 2>/dev/null";$appendix_cmd1{15} = "ps -ef | grep -v \"\\.sh\" | grep -v \"\\.pl\"";$appendix_cmd1{0} = "uname -a 2>/dev/null";$appendix_cmd1{8} = "last -100 2>/dev/null";$appendix_cmd1{13} = "rm -v /tmp/NSF{nsf_tm}_nsfocus_grub_tmp";$appendix_cmd1{19} = "cat /etc/ftpaccess 2>/dev/null | grep \"^[[:space:]]*banner[[:space:]]*\\/.*\" | awk '{print \$2}' | while read user; do cat \$user;done | grep -v \"^[[:space:]]*#\" | head -300";$appendix_cmd1{12} = "(head -20 /var/log/syslog;head -20 /var/log/messages) 2>/dev/null";$appendix_cmd1{16} = "if [ -f /etc/vsftpd.conf ];then cat /etc/vsftpd.conf |grep -v ^#|grep ftpd_banner;elif [ -f /etc/vsftpd/vsftpd.conf ];then cat /etc/vsftpd/vsftpd.conf |grep -v ^#|grep ftpd_banner;fi";
# 获取操作系统信息函数
sub get_os_info{
 my %os_info = (
 "hostname"=>"","osname"=>"","osversion"=>"");
 $os_info{"hostname"} = `uname -n`;
 $os_info{"osname"} = `uname -s`;
 $os_info{"osversion"} = `uname -r`;
foreach (%os_info){   chomp;}
return %os_info;}

# 执行命令存入xml文件
sub add_item{
 my ($string, $flag, $command, $value)= @_;
 $string .= "\t\t".'<item flag="'.$flag.'">'."\n";
 $string .= "\t\t\t".'<cmd info="'.$date.'">'."\n";
 $string .= "\t\t\t<command><![CDATA[".$command."]]></command>\n";
 $string .= "\t\t\t<value><![CDATA[".$value."]]></value>\n";
 $string .= "\t\t\t</cmd>\n";
 $string .= "\t\t</item>\n";
return $string;}
 sub generate_xml{
 $ARGC = @ARGV;
if($ARGC lt 2){
 print qq{usag: ffabcdef-2020-0514-2011-aaa340401710.pl  <SU用户(SU或高权限用户)> <SU密码>};
exit;}
my %os_info = get_os_info();
 my $os_name = $os_info{"osname"};
 my $host_name = $os_info{"hostname"};
 my $os_version = $os_info{"osversion"};
 my $date = `date +%y-%m-%d`;
 chomp $date;
 my $ipaddr = "";
 my $ipaddr = `ifconfig | grep -oE 'inet[[:space:]]*(addr)?\.?([0-9]{1,3}\\.?){4}' | grep -v 127 | grep -oE '([0-9]{1,3}\\.?){4}' | head -n 1`;
 chomp $ipaddr;
 my $xml_string = "";
 $xml_string .='<?xml version="1.0" encoding="UTF-8"?>'."\n";
 $xml_string .= '<result uuid= "'.'ffabcdef-2020-0514-2011-aaa340401710'.'" ip="'.$ipaddr.'" template_time= "2020-05-14 20:11:34'.'">'."\n";
 $xml_string .= "\t".'<initcmd>'."\n";
 $xml_string .= "\t\t".'<cmd info="'.$date.'">';
 $xml_string .= '</cmd>'."\n";
 $xml_string .= "\t\t\t".'<command><![CDATA[ ]]></command>'."\n";
 $xml_string .= "\t\t\t".'<value><![CDATA[ ]]></value>'."\n";
 $xml_string .= "\t".'</initcmd>'."\n";
 $xml_string .= "\t".'<security type="auto">'."\n";
 foreach $key (@array_pre_flag){
 $value = $pre_cmd{$key};
 $value_1 = $pre_cmd1{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_string = &add_item( $xml_string, $key, $value_1, $tmp_result );}
 $xml_string .= "\t</security>\n";
 $xml_string .= "\t".'<security type="display">'."\n";
 foreach $key (@array_appendix_flag){
 $value = $appendix_cmd{$key};
 $value_1 = $appendix_cmd1{$key};
 my $tmp_result = `$value`;
 chomp $tmp_result;
 $tmp_result =~ s/>/&gt;/g;
 $xml_string = &add_item( $xml_string, $key, $value_1, $tmp_result );}
 $xml_string .= "\t"."</security>"."\n";
 $xml_string .= "</result>"."\n";
 $xmlfile = $ipaddr."_"."ffabcdef-2020-0514-2011-aaa340401710"."_chk.xml";
 print $xmlfile."\n";
 open XML,">/tmp/".$xmlfile or die "Cannot create ip.xml:$!";
 print XML $xml_string;
 print "end write xml\n";
 print "DONE ALL\n";}
 generate_xml();
