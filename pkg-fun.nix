{ lib, stdenv, sqlite }: stdenv.mkDerivation {
  pname                 = "sqlite3pp";
  version               = "1.0.8";
  include               = builtins.path { path = ./include; };
  lib                   = builtins.path { path = ./lib;     };
  propagatedBuildInputs = [sqlite.dev];
  unpackPhase           = ":";
  dontPatch             = true;
  dontConfigure         = true;
  dontBuild             = true;
  installPhase          = ''
    mkdir -p "$out/lib/pkgconfig";
    cp -r "$include" "$out/include";
    sed "s,@PREFIX@,$out," "$lib/pkgconfig/sqlite3pp.pc.in"  \
        > "$out/lib/pkgconfig/sqlite3pp.pc";
  '';
  meta.license = lib.licenses.mit;
}
