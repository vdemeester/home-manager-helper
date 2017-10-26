{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "home-manager-helper";
  phases = [ "installPhase" ];
  installPhase = ''
    install -v -D -m755 ${./bin/hm} $out/bin/hm

    cp -r ${./example} $out/example

    substituteInPlace $out/bin/hm \
      --subst-var-by example "$out/example"
  '';

  meta = with pkgs.stdenv.lib; {
    description = "A helpful wrapper around home-manager";
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
