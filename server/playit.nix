{ serverConfigs, ... }: {
  services.playit = {
    enable = true;
    secretPath = serverConfigs.playit.secret_path;
  };
}
