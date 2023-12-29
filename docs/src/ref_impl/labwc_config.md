<!--
    Copyright 2022-2023 TII (SSRC) and the Ghaf contributors
    SPDX-License-Identifier: CC-BY-SA-4.0
-->

# LabWC configuring

This tutorial assumes that ghaf already uses [labwc](https://labwc.github.io/index.html).

The basis of the labwc configuration is the set of folowing files: rc.xml, menu.xml, autostart and environment.
This files can be changed during the development by substituting in labwc overlay `overlays/custom-packages/labwc/default.nix`.

# Frame coloring

Ghaf uses patched labwc which make it possible to change the frame color for choosen app. It is implemented on the basis of window rules by substituting the server decoration colors (that's why `serverDecoration` property must be set to `yes`). The `borderColor` property is responsible for frame color:

```
<windowRules>
  <windowRule identifier="Foot" borderColor="#00ffff" serverDecoration="yes" skipTaskbar="yes"  />
  <windowRule identifier="firefox" borderColor="#ff0000" serverDecoration="yes" skipTaskbar="yes"  />
</windowRules>
```
According to the labwc spec the identifier `relates to app_id for native Wayland windows and WM_CLASS for XWayland clients` and case-sensitive.
