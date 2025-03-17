{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "wings";
  version = "1.0.0-beta10";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "wings";
    rev = "v${version}";
    hash = "sha256-uguyBf9m77NBkPjoGGC2xqiH0QqGyu9TgihiRCH15SQ=";
  };

  vendorHash = "sha256-5ARXFWVZJhU0M+QritUdTJwG2KzsTIs6U+9m3eLsHQE=";
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
