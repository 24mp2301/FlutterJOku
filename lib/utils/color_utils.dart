import 'package:flutter/material.dart';

/// Converts a hex color string like "#RRGGBB" or "RRGGBB" to a [Color] object.
/// Supports optional leading "#" and assumes full opacity if not specified.
Color hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor"; // Adds full opacity if not provided
  }
  return Color(int.parse(hexColor, radix: 16));
}
