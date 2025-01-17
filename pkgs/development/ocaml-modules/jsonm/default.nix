{ stdenv, lib, fetchurl, ocaml, findlib, ocamlbuild, topkg, uutf }:

stdenv.mkDerivation rec {
  pname = "ocaml${ocaml.version}-jsonm";
  version = "1.0.1";

  src = fetchurl {
    url = "https://erratique.ch/software/jsonm/releases/jsonm-${version}.tbz";
    sha256 = "1176dcmxb11fnw49b7yysvkjh0kpzx4s48lmdn5psq9vshp5c29w";
  };

  buildInputs = [ findlib topkg ];
  nativeBuildInputs = [ ocaml findlib ocamlbuild ];
  propagatedBuildInputs = [ uutf ];

  inherit (topkg) buildPhase installPhase;

  meta = {
    description = "An OCaml non-blocking streaming codec to decode and encode the JSON data format";
    homepage = "https://erratique.ch/software/jsonm";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ vbgl ];
    platforms = ocaml.meta.platforms or [];
  };
}
