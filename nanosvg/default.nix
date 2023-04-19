{ lib, stdenv, fetchFromGitHub, tree }:

stdenv.mkDerivation rec {
  pname = "nanosvg";
  version = "2022.12.22";

  src = fetchFromGitHub {
    owner = "fltk";
    repo = pname;
    rev = "abcd277ea45e9098bed752cf9c6875b533c0892f";
    sha256 = "sha256-WNdAYu66ggpSYJ8Kt57yEA4mSTv+Rvzj9Rm1q765HpY=";
  };

  installPhase = ''
    mkdir -p $out/include/
    cp ./src/nanosvg.h $out/include/nanosvg.h
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
