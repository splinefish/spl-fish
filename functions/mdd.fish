function mdd
  if test -d $argv[1]
    echo "Missing input file."
  else
    set -l device (sudo losetup -f --show /home/splinefish/.$argv.bin)
    sudo cryptsetup luksOpen $device c1
    sudo mount /dev/mapper/c1 /mnt/dd
  end
end
