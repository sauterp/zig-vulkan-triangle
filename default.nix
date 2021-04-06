with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz") {};

pkgs.mkShell {
	buildInputs = [
		shaderc
                vulkan-loader
                vulkan-validation-layers
                glfw
	];

	shellHook = ''
		source env.sh
		echo activated zig environment
	'';
}
