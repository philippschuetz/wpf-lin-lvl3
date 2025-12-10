{
  imports = [
    ./hardware-configuration.nix
    ./services
    ../common/global
    ../common/users/panteschuetz
    ../common/optional/ssh.nix
  ];

  networking = {
    hostName = "backup_FA-C-32_oszimt_lan";
    useDHCP = true;
    firewall = {
      enable = true;
    };
    # interfaces = {
    #   ens3.ipv4 = {
    #     routes = [
    #       {
    #         address = "192.168.100.4";
    #         prefixLength = 24;
    #         via = "192.168.100.1";
    #       }
    #     ];
    #     addresses = [
    #       {
    #         address = "192.168.100.4";
    #         prefixLength = 24;
    #       }
    #     ];
    #   };
    # };
  };

  system.stateVersion = "25.05";
}
