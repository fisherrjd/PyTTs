{ pkgs ? import
    (fetchTarball {
      name = "jacobi-2023-04-26";
      url = "https://nix.cobi.dev/x/a807a91e42f3ab64fb4a84c975d006fab2cbd5c9";
      sha256 = "07dy4dfr3d644yw59j8mjhzx79b0v04a1z6sfmxjifzcb7fi1wvn";
    })
    { }
}:
let
  name = "pytts";

  tools = with pkgs; {
    cli = [
      coreutils
      nixpkgs-fmt
    ];
    python = [
      (python310.withPackages (p: with p; [
        requests
        pyaudio
      ]))
    ];
  };

  paths = pkgs.lib.flatten [ (builtins.attrValues tools) ];
in
pkgs.buildEnv {
  inherit name paths;
  buildInputs = paths;
}