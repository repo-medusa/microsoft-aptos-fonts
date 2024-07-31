{ lib, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  pname = "microsoft-aptos-fonts";
  version = "4.40";

  src = ./fonts;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -D $src/*.ttf -t $out/share/fonts/truetype/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Microsoft Aptos fonts for local installation for use in applications that do not have access to the Office Font Service.";
    homepage = "https://learn.microsoft.com/en-us/typography/font-list/aptos";
    license = lib.licenses.unfree;

    platforms = platforms.all;
  };
}
