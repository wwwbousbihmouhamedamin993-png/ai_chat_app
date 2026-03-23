import 'package:flutter/material.dart';
import 'package:ai_chat_app/features/home_page/data/gemini_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final geminiService = GeminiService();
  final textC = TextEditingController();
  String text = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('chat with gemini')),
      body: Column(
        children: [
          TextField(
            controller: textC,
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              if (textC.text == '') return;
              final prompt = textC.text;
              try {
                String reply = await geminiService.sendMesaage(prompt);
                setState(() {
                  text = reply;
                  isLoading = false;
                });
              } catch (e) {
                print(e.toString());
                setState(() {
                  isLoading = false;
                });
              }
            },
            child: Text('send'),
          ),
          isLoading ? CircularProgressIndicator() : Text(text),
        ],
      ),
    );
  }
}
