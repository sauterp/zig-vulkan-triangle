with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz") {};

let 
  zig080 = callPackage ./zig0.8.0.nix {};
in mkShell {
  buildInputs = [
    zig080
    shaderc
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    glfw
  ];

  shellHook = ''
    echo activated zig environment
  '';
}
