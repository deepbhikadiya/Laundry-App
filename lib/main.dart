import 'package:ft_washing_app/package/config_packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPref().isPreferenceReady;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (AppPref().languageCode.isEmpty) {
    final String defaultLocale = Platform.localeName.split('_')[0];
    AppPref().languageCode =
        (defaultLocale.toLowerCase() == 'ar') ? defaultLocale : 'en';
    if (AppPref().languageCode.isEmpty) {
      AppPref().languageCode = 'en';
    }
  }
  runApp(const MyApp());
}
