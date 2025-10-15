{
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/panteschuetz
  ];

  networking = {
    hostName = "gateway_FA-C-32_oszimt_lan";
    useDHCP = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [80];
    };
    interfaces = {
      ens3.useDHCP = true;
      ens4.ipv4.addresses = [
        {
          address = "192.168.100.1";
        }
      ];
    };
    nat = {
      enable = true;
      internalInterfaces = ["ens4"];
      externalInterface = "ens3";
      forwardPorts = [
        {
          destination = "192.168.100.2:80";
          proto = "tcp";
          sourcePort = 80;
        }
      ];
    };
  };

  system.stateVersion = "25.05";
}
