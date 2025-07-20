{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "wings";
  version = "1.0.0-beta15";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "wings";
    rev = "v${version}";
    hash = "sha256-my7FiYIs/chw3RjygrLU5zGMzr0TETRSXvlUdH8q548=";
  };

  vendorHash = "sha256-a4FmIFd9CcvfXn8+qHAvROxmQCsOGjm/5a+tm4SSmzw=";
  subPackages = [ "." ];

  ldflags = [
    "-X github.com/pelican-dev/wings/system.Version=${version}"
  ];

  meta = {
    description = "Pelican Wings Daemon";
    homepage = "https://github.com/pelican-dev/wings";
    license = lib.licenses.mit;
  };
}
