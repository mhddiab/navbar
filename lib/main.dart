import 'package:final_app/generated/l10n.dart';
import 'package:final_app/moduls/generateroute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/loading_screen.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My flutter app updatedgdfsd sgggggg ",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
     initialRoute: LoadingScreen.id,
     onGenerateRoute: OngenerateRoute.GenerateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

