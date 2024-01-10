import 'package:expense_tracker/bindings/new_expense_binding.dart';
import 'package:expense_tracker/routes.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 220, 189, 252));
var kDartkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // aşağıdaki yorum satırı uygulamanın hangi yöne doğru sabit olduğunu anlatıyor
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [
  //       DeviceOrientation.portraitUp
  //
  //     ]
  // ).then((fn) {
  //   runApp(GetMaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData().copyWith(
  //       useMaterial3: true,
  //       appBarTheme: AppBarTheme().copyWith(backgroundColor: kColorScheme.onPrimaryContainer, foregroundColor: kColorScheme.primaryContainer),
  //       scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 252),
  //       cardTheme: CardTheme().copyWith(color: kColorScheme.secondaryContainer, margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
  //     ),
  //     initialRoute: Expenses.routename,
  //     initialBinding: NewExpenseBinding(),
  //     getPages: routes,
  //   ));
  //
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        appBarTheme: AppBarTheme().copyWith(backgroundColor: kColorScheme.onPrimaryContainer, foregroundColor: kColorScheme.primaryContainer),
        scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 252),
        cardTheme: CardTheme().copyWith(color: kColorScheme.secondaryContainer, margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      ),
      initialRoute: Expenses.routename,
      initialBinding: NewExpenseBinding(),
      getPages: routes,
    );
  }
}
