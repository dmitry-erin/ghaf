# Copyright 2022-2023 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  pkgs,
  lib,
}:
pkgs.stdenv.mkDerivation {
  pname = "labwc";
  version = "0.7";

  src = ./.;

  nativeBuildInputs = with pkgs; [
    gettext
    meson
    ninja
    pkg-config
    scdoc
    wayland-scanner
  ];

  buildInputs = with pkgs; [
    cairo
    glib
    libdrm
    libinput
    libxkbcommon
    libxml2
    pango
    wayland
    wayland-protocols
    wlroots_0_16
    xwayland
  ];

  mesonFlags = [
    (lib.mesonEnable "xwayland" false)
  ];

  meta = with lib; {
    homepage = "https://github.com/dmitry-erin/labwc";
    description = "A Wayland stacking compositor, similar to Openbox";
    license = licenses.gpl2Plus;
    inherit (pkgs.wayland.meta) platforms;
  };
}
