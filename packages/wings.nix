{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "wings";
  version = "1.0.0-beta18";

  src = fetchFromGitHub {
    owner = "pelican-dev";
    repo = "wings";
    rev = "v${version}";
    hash = "sha256-m5cgyenBUt6W5M1IpKLg5F8GAnyPZ1chHk4HSseGmr0=";
  };

  vendorHash = "sha256-bPsoneaYHcOi57S1/U8FvCefTqSMMswqrC+SLW3Q2OQ=";
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
