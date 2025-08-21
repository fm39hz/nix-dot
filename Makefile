.PHONY: update clean build nixos-config

update:
	home-manager switch -b backup --flake .#fm39hz-desktop --extra-experimental-features 'nix-command flakes'

clean:
	nix-collect-garbage -d

build:
	home-manager build --flake .#fm39hz-desktop --extra-experimental-features 'nix-command flakes'

switch:
	sudo nixos-rebuild switch --flake .#fm39hz-desktop

nixos-config:
	sudo nixos-generate-config --root ./ --show-hardware-config > hardware-configuration.nix
