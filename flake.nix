{
  description = "Scala3 derivation bench flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    java.url = "github:TawasalMessenger/jdk-flake/zing-jdk15.0.1-fp.dev-3392";
    sbt-src = {
      url = "https://github.com/sbt/sbt/releases/download/v1.4.7/sbt-1.4.7.zip";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-compat, java, sbt-src }:
    let
      sources = with builtins; (fromJSON (readFile ./flake.lock)).nodes;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # jdk = pkgs.jdk15;
      jdk = java.defaultPackage.${system};
      sbt = pkgs.sbt.overrideDerivation (
        _: with pkgs; rec {
          name = "sbt";
          version = null;

          src = sbt-src;

          buildInputs = [ makeWrapper zlib ];

          installPhase = ''
            mkdir -p $out/share/sbt $out/bin
            cp -ra . $out/share/sbt
            ln -s $out/share/sbt/bin/sbt $out/bin/
            wrapProgram $out/bin/sbt \
              --prefix PATH : ${lib.makeBinPath [ jdk ]} \
              --set JAVA_HOME ${jdk.home}
          '';

          patchPhase = ''
            echo -java-home ${jdk.home} >> conf/sbtopts
          '';
        }
      );
    in
    rec {
      devShell.${system} = pkgs.callPackage ./shell.nix {
        inherit jdk sbt;
      };
    };
}
