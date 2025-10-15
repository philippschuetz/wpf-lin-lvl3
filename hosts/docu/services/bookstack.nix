let
  domain = "example.com";
in {pkgs, ...}: {
  services.bookstack = {
    user = "bookstack";
    group = "bookstack";
    package = pkgs.bookstack;
    enable = true;
    dataDir = "/var/lib/bookstack";
    hostname = domain;
    appURL = domain;
    # https://github.com/BookStackApp/BookStack/blob/development/.env.example.complete
    config = {
      APP_TIMEZONE = "Europe/Berlin";
      AUTH_METHOD = "standard";
    };
  };
}
