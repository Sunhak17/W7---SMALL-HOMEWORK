import 'package:flutter/widgets.dart';

import '../../data/repositories/settings/app_settings_repository.dart';
import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository repository;

  AppSettings? _appSettings;

  AppSettingsState({required this.repository}) {
    init();
  }

  Future<void> init() async {
    _appSettings = await repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;

    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    await repository.save(_appSettings!);

    notifyListeners();
  }
}
