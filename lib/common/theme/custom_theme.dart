import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/theme/color/carrot_app_colors.dart';
import 'package:fast_app_base/common/theme/color/dark_app_colors.dart';
import 'package:fast_app_base/common/theme/color/light_app_colors.dart';
import 'package:fast_app_base/common/theme/shadows/dart_app_shadows.dart';
import 'package:fast_app_base/common/theme/shadows/light_app_shadows.dart';
import 'package:flutter/material.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    DarkAppShadows(),
    name: '다크',
    color: AppColors.veryDarkGrey,
  ),
  light(
    LightAppColors(),
    LightAppShadows(),
    name: '화이트',
    color: AppColors.brightGrey,
  ),
  carrot(
    CarrotAppColors(),
    LightAppShadows(),
    name: '당근',
    color: AppColors.darkOrange,
  );

  const CustomTheme(
    this.appColors,
    this.appShadows, {
    required this.name,
    required this.color,
  });

  final AbstractThemeColors appColors;
  final AbsThemeShadows appShadows;
  final String name;
  final Color color;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
      case CustomTheme.carrot:
        return carrotTheme;
    }
  }
}

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    // 폰트 변경 가능
    // textTheme: CustomGoogleFonts.diphylleiaTextTheme(
    //   ThemeData(brightness: Brightness.light).textTheme,
    // ),
    colorScheme:
        ColorScheme.fromSeed(seedColor: CustomTheme.light.appColors.seedColor));

const darkColorSeed = Color(0xbcd5ff7e);
ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.veryDarkGrey,
    // textTheme: GoogleFonts.nanumMyeongjoTextTheme(
    //   ThemeData(brightness: Brightness.dark).textTheme,
    // ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: CustomTheme.dark.appColors.seedColor,
        brightness: Brightness.dark));

ThemeData carrotTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    // textTheme: CustomGoogleFonts.diphylleiaTextTheme(
    //   ThemeData(brightness: Brightness.light).textTheme,
    // ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: CustomTheme.carrot.appColors.seedColor));
