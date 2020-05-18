#!/bin/sh
[ $# -ne 2 ] && { 
 echo "Usage: sh ffabcdef-2020-0514-2011-aaa340401710.sh  <SU用户(SU或高权限用户)> <SU密码>";
 exit 1;
}
# 获取当前路径

pathname=`pwd`


echo "touch /tmp/nsfocus_mod_tmp;">/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "chmod 777 /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "if [ -f \"/etc/grub.conf\" ];then">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /etc/grub.conf | grep 'l[r-][w-][x-]'\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    if [ -z \"\$grub_mod\" ];then">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        grub_mod=\`ls -l /etc/grub.conf\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        chmod --reference=/etc/grub.conf /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    else">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        grub_mod=\`ls -l /boot/grub/grub.conf\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        chmod --reference=/boot/grub/grub.conf /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    fi">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "elif [ -f \"/boot/grub/grub.conf\" ];then">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /boot/grub/grub.conf\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    chmod --reference=/boot/grub/grub.conf /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "elif [ -f \"/etc/lilo.conf\" ];then">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /etc/lilo.conf\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    chmod --reference=/etc/lilo.conf /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "elif [ -f \"/etc/grub2.cfg\" ];then">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    grub_mod=\`ls -l /etc/grub2.cfg | grep 'l[r-][w-][x-]'\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    if [ -z \"\$grub_mod\" ];then">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        grub_mod=\`ls -l /etc/grub2.cfg\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        chmod --reference=/etc/grub2.cfg /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    else">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        grub_mod=\`ls -l /boot/grub2/grub.cfg\`;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "        chmod --reference=/boot/grub2/grub.cfg /tmp/nsfocus_mod_tmp;">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "    fi">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
echo "fi">>/tmp/NSF{nsf_tm}_nsfocus_grub_tmp
sh /tmp/NSF{nsf_tm}_nsfocus_grub_tmp

# 执行pl脚本
perl $pathname/ffabcdef-2020-0514-2011-aaa340401710.pl "${1}" "${2}"
