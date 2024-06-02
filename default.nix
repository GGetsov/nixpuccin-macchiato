{
  gnome-shell-theme = (final: prev: {
    gnome = prev.gnome.overrideScope (finalg: prevg: {
      gnome-shell = prevg.gnome-shell.overrideAttrs (attrs: {
        postInstall = (attrs.postInstall or "") + ''
        glib-compile-resources ${./gnome-shell/gnome-shell-theme.gresource.xml} --sourcedir=${./gnome-shell} --target=$out/share/gnome-shell/gnome-shell-theme.gresource
        '';
      });
    });
  });
  gtk = ./gtk;
}
