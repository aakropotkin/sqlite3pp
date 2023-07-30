{ stdenv }: stdenv.mkDerivation {
  pname   = "sqlite3pp";
  version = "1.0.8";
  buildCommand = ''
    mkdir -p "$out/include";
    cp "${./sqlite3pp.hh}"     "$out/include/sqlite3pp.hh";
    cp "${./sqlite3pp.ipp}"    "$out/include/sqlite3pp.ipp";
    cp "${./sqlite3ppext.hh}"  "$out/include/sqlite3ppext.hh";
    cp "${./sqlite3ppext.ipp}" "$out/include/sqlite3ppext.ipp";
  '';
}
