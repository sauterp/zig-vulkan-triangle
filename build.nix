with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz") {};

zig = stdenv.mkDerivation rec {
  name = "zig";

  buildname = "zig-linux-x86_64-0.8.0-dev.1714+6fc822a94";
  src = fetchurl {
    url = "https://ziglang.org/builds/" + buildname + ".tar.xz";
    sha256 = "06z72m5r9qvd9krwc3f8vx60bgwhfr82as96aibmkkhcai54dacw";
  };

  nativeBuildInputs = [
    gnutar
  ];

  buildInputs = [];

  unpackPhase = ''
    tar xJf $src
  '';

  installPhase = ''
    cp -R $buildname $out
  '';
};
