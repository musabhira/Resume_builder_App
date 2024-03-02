import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_app/view/home_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final darkLight = useState(false);

    useEffect(() {
      final prefs = SharedPreferences.getInstance();
      prefs.then((value) => darkLight.value = value.getBool('theme') ?? false);

      return null;
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkLight.value
          ? ThemeData.dark()
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)),
      home: HomePage(
        theme: darkLight,
      ),
    );
  }
}
