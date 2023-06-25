function umdd
  sudo umount /mnt/dd
  sudo cryptsetup luksClose c1
  sudo losetup -d /dev/loop0
end
