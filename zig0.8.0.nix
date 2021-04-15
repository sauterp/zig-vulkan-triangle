{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "zig080";

  buildname = "zig-linux-x86_64-0.8.0-dev.1714+6fc822a94";
  src = pkgs.fetchurl {
    url = "https://ziglang.org/builds/" + buildname + ".tar.xz";
    sha256 = "06z72m5r9qvd9krwc3f8vx60bgwhfr82as96aibmkkhcai54dacw";
  };

  nativeBuildInputs = [
    pkgs.gnutar
  ];

  buildInputs = [];

  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    tar xJf $src
    cp -R $buildname $out
    mkdir $out/bin
    mv $out/zig $out/bin/
    chmod +x $out/bin/zig
  '';
}
