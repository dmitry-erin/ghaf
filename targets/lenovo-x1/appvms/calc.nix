# Copyright 2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
#
{pkgs, ...}: {
  name = "calc";
  packages = [pkgs.calculator];
  macAddress = "02:00:00:03:08:01";
  ramMb = 512;
  cores = 1;
  extraModules = [
    {
      time.timeZone = "Asia/Dubai";
      hardware.opengl.enable = true;
    }
  ];
}
