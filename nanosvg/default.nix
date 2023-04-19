{ lib, stdenv, fetchFromGitHub, tree }:

stdenv.mkDerivation rec {
  pname = "nanosvg";
  version = "2022.12.4";

  src = fetchFromGitHub {
    owner = "memononen";
    repo = pname;
    rev = "9da543e8329fdd81b64eb48742d8ccb09377aed1";
    sha256 = "sha256-VOiN6583DtzGYPRkl19VG2QvSzl4T9HaynBuNcvZf94=";
  };

  buildInputs = [ tree ];

  installPhase = ''
    mkdir -p $out/include/nanosvg/
    cp ./src/nanosvg.h $out/include/nanosvg/nanosvg.h
  '';

  meta = with lib; {
    description = "Simple stupid SVG parser";
    longDescription = ''
      NanoSVG is a simple stupid single-header-file SVG parse.
      The output of the parser is a list of cubic bezier shapes.
    '';
    homepage = "https://github.com/memononen/nanosvg";
    license = licenses.zlib;
    platforms = platforms.all;
    maintainers = [];
  };
}
