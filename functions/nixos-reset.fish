function nixos-reset
  set -l local_config ~/work/nixos/*
  set -l nixos_config /etc/nixos/

  sudo cp -R $local_config $nixos_config
  sudo nixos-rebuild switch
end
