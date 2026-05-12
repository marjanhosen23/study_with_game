import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:study_with_game/common/splash.dart';
import 'package:study_with_game/theme/theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(

    url: 'https://iyxrkwibceibicvrkctj.supabase.co',

    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml5eHJrd2liY2VpYmljdnJrY3RqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg0MzEwNjIsImV4cCI6MjA5NDAwNzA2Mn0.vuZ7QucvhLoOeoWnUXdJvX84aLzahHAhJMKwi906eNE',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: lightTheme,

      home: const Splash(),
    );
  }
}