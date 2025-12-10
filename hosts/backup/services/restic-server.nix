let
  port = 8000;
in
  {...}: {
    services.restic.server = {
      enable = true;
      listenAddress = "127.0.0.1:${toString port}";
      dataDir = "/var/lib/restic";
    };
  }
