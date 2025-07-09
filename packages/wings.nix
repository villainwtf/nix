{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "wings";
  version = "1.0.0-beta14";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "wings";
    rev = "v${version}";
    hash = "sha256-SDPHngoVp1k5vAzyMdCpeTtbkthtLxwazZPUD5Y2+KI=";
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
