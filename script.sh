#!/bin/bash
sudo -i

echo 'Ставим пакеты'
yum -y install wget

echo 'Правим имя vg'
vgrename vGroup_01 OtusRoot

echo ' Правим grub и fstab'
sed -i 's/vGroup_01/OtusRoot/g' /etc/fstab /etc/default/grub /boot/grub2/grub.cfg
# Пересоздаем initrd image
#mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)

echo ' Добавляем модуль в initrd'
mkdir /usr/lib/dracut/modules.d/01test
cd /usr/lib/dracut/modules.d/01test
wget https://gist.github.com/lalbrekht/e51b2580b47bb5a150bd1a002f16ae85/archive/80060b7b300e193c187bbcda4d8fdf0e1c066af9.zip && wget https://gist.github.com/lalbrekht/ac45d7a6c6856baea348e64fac43faf0/archive/69598efd5c603df310097b52019dc979e2cb342d.zip
unzip \*.zip
cp ac45d7a6c6856baea348e64fac43faf0-69598efd5c603df310097b52019dc979e2cb342d/gistfile1.txt ./test.sh
cp e51b2580b47bb5a150bd1a002f16ae85-80060b7b300e193c187bbcda4d8fdf0e1c066af9/gistfile1.txt ./module-setup.sh

echo ' Пересоздаем initrd image'
mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)
echo ' Правим grub '
sed -i 's/rhgb //g' /boot/grub2/grub.cfg
sed -i 's/ quiet//g' /boot/grub2/grub.cfg

echo 'Можно перезагружать'
vgs
