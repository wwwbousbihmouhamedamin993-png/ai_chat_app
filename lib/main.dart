import 'package:ai_chat_app/features/home_page/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://eqkxbimboornjwyvmpgr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxa3hiaW1ib29ybmp3eXZtcGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQwNDg2MjksImV4cCI6MjA4OTYyNDYyOX0.nhtMs4XRZCXxs32ikXYKen9WKLZf_qFtJL0w6VnhpHQ',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
