{ fetchFromGitHub, cljpkgs, openjdk19, jdk17_headless }:
cljpkgs.mkCljBin rec {
  name = "maelstrom";
  version = "0.2.3";
  projectSrc = fetchFromGitHub {
    owner = "jepsen-io";
    repo = name;
    rev = "v${version}";
    sha256 = "sha256-nZS2oVF/m3yGU+HFD1sXdZbZaOfxYm3HMrxuCRZ0VMg=";
  };
  buildCommand = "lein uberjar";
  main-ns = "maelstrom.core";
  lockfile = ./deps-lock.json;
  jdkRunner = openjdk19;
  jarPath="target/${name}-${version}-standalone.jar";
  # @TODO: figure out how to properly support "demo" mode
}
