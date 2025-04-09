{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "wings";
  version = "1.0.0-beta11";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "wings";
    rev = "v${version}";
    hash = "sha256-Y4JMEe7kIv9a/KpUCIRhtGxLQIS3NwZvgbeqGkZF1dE=";
  };

  vendorHash = "sha256-Dgw+b8OS01HRsL8IhxgjOjNlx25K/Zj3A27IVpJQ/kw=";
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
