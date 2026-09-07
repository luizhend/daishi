{pkgs, serverConfigs,...}: {
  imports = [
    ./playit.nix
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers.daishi-purpur = {
      enable = true;
      package = pkgs.purpurServers.purpur-1_21_11;
      jvmOpts = "-Xms4G -Xmx8G";

      serverProperties = {
        difficulty = 3;
        gamemode = 0;
        online-mode = false;
        server-port = serverConfigs.server.port;
        view-distance = 16;
        motd = serverConfigs.server.motd;
      };
    };

  };
}
