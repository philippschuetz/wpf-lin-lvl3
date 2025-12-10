let
  port = 8000;
in
  {...}: {
    services.restic.server = {
      enable = true;
      listenAddress = "127.0.0.1:${toString port}";
      dataDir = "/var/lib/restic";
      extraFlags = [
        "--no-auth"
      ];
    };
    fileSystems."/var/lib/restic" = {
      depends = [
        "/backup"
        "/var/lib/restic"
      ];
      device = "/backup";
      fsType = "none";
      options = [
        "bind"
      ];
    };
  }
