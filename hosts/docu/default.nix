{
  imports = [
    ./hardware-configuration.nix
    ./services
    ../common/global
    ../common/users/panteschuetz
    ../common/optional/ssh.nix
  ];

  networking = {
    hostName = "docu_FI-C-32_oszimt_lan";
    useDHCP = true;
    firewall = {
      enable = true;
    };
    interfaces = {
      ens3.ipv4.addresses = [
        {
          address = "192.168.100.2";
        }
      ];
    };
  };

  system.stateVersion = "25.05";
}
