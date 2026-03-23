import 'package:dio/dio.dart';

class GeminiService {
  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://eqkxbimboornjwyvmpgr.supabase.co/functions/v1/chat-with-gemini',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxa3hiaW1ib29ybmp3eXZtcGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQwNDg2MjksImV4cCI6MjA4OTYyNDYyOX0.nhtMs4XRZCXxs32ikXYKen9WKLZf_qFtJL0w6VnhpHQ',
      },
    ),
  );

  Future<String> sendMesaage(String prompt) async {
    final response = await dio.post(
      '',
      data: {'message': prompt},
    );
    return response.data['reply'];
  }
}
