{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "wings";
  version = "1.0.0-beta22";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "wings";
    rev = "v${version}";
    hash = "sha256-CVH3oiqDa/kLEstvLwO45/jetKI/V1wlrXK1C+CVzgs=";
  };

  vendorHash = "sha256-Nkz9qz8rh+1dO9lGrTLLO0mOXLtcQmxi1R1jGxWiKic=";
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
