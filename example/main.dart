import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_ext/easy_localization_ext.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await EasyLocalization.ensureInitialized();
  const en = Locale('en');

  runApp(
    EasyLocalization(
      supportedLocales: const [en],
      startLocale: en,
      fallbackLocale: en,
      path: 'assets/translations',
      assetLoader: MultiAssetLoader([
        YamlPackageAssetLoader('package1'),
        YamlPackageAssetLoader('package2', path: 'overrides_path'),
        YamlAssetLoader(),
      ]),
      child: const MyApp(),
    ),
  );
}
