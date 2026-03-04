import '../../../model/settings/app_settings.dart';
import 'app_settings_repository.dart';

class AppSettingsRepositoryMock extends AppSettingsRepository {
  @override
  Future<AppSettings> load() async {
    print("Loading app settings from local preferences...");
    return AppSettings(themeColor: ThemeColor.blue);
  }

  @override
  Future<void> save(AppSettings settings) async {
    print("Saving app settings to local preferences...");
    // Later..
  }
}
