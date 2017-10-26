{ pkgs, ... }: {

  home.packages = [ pkgs.hello ];
  home.file.".hello.conf".source = ./hello.conf;

}
