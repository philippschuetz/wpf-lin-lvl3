let
  vars = import ../vars.nix;
  targetHost = "192.168.100.4";
  targetPort = "8000";
in
  {config, ...}: {
    services.restic.backups = {
      "backup" = {
        paths = [
          "/etc"
          "/home"
          "/data"
        ];
        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 5"
          "--keep-monthly 12"
        ];
        checkOpts = [
          "--read-data-subset=10%"
        ];
        initialize = true;
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
        };
        # backupPrepareCommand = ''
        # '';
        # backupCleanupCommand = ''
        # '';
        repository = "rest:http://${targetHost}:${targetPort}";
      };
    };
  }
