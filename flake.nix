{
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
      nix-minecraft.url = "github:Infinidoge/nix-minecraft";
      playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";
  };
  outputs = {
    nixpkgs,
    nix-minecraft,
    playit-nixos-module,
    ...
  }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs{
      inherit system;
    };
    in{
    nixosModules.default = {

      imports = [
        playit-nixos-module.nixosModules.default
        nix-minecraft.nixosModules.minecraft-servers
                  {
                    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
                  }
        ./server/server.nix
      ];
      _module.args = {
             inherit inputs;
             serverConfigs = (import ./server/config.nix).config;
           };

    };
    };
}
