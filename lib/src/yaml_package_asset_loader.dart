import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

/// Loads a YAML file from a package.
class YamlPackageAssetLoader extends YamlAssetLoader {
  /// The package name.
  final String package;

  /// The path to the YAML file in the [package].
  /// Defaults to the global path defined in [EasyLocalization.path].
  final String? path;

  ///
  YamlPackageAssetLoader(
    this.package, {
    this.path,
  });

  @override
  String getLocalePath(String basePath, Locale locale) {
    // Copied from easy_localization's RootBundleAssetLoader as of v3.0.1
    return 'packages/$package/${path ?? basePath}/${locale.toStringWithSeparator(separator: '-')}.yaml';
  }
}
