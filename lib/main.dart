import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  // Hàm phát âm thanh theo số thứ tự của phím đàn (1 - 7)
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  // Hàm xây dựng widget cho từng phím đàn Xylophone
  Widget buildKey({
    required Color color,
    required int soundNumber,
    required String noteName,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 4.0,
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                noteName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black38,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone App',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF1E1E2C),
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.music_note, color: Colors.amberAccent),
              SizedBox(width: 8),
              Text(
                'Xylophone',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.music_note, color: Colors.amberAccent),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF161622),
          elevation: 6,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(
                  color: const Color(0xFFE53935), // Red
                  soundNumber: 1,
                  noteName: 'C - Đô',
                ),
                buildKey(
                  color: const Color(0xFFFB8C00), // Orange
                  soundNumber: 2,
                  noteName: 'D - Rê',
                ),
                buildKey(
                  color: const Color(0xFFFDD835), // Yellow
                  soundNumber: 3,
                  noteName: 'E - Mi',
                ),
                buildKey(
                  color: const Color(0xFF43A047), // Green
                  soundNumber: 4,
                  noteName: 'F - Fa',
                ),
                buildKey(
                  color: const Color(0xFF00ACC1), // Teal/Cyan
                  soundNumber: 5,
                  noteName: 'G - Sol',
                ),
                buildKey(
                  color: const Color(0xFF1E88E5), // Blue
                  soundNumber: 6,
                  noteName: 'A - La',
                ),
                buildKey(
                  color: const Color(0xFF8E24AA), // Purple
                  soundNumber: 7,
                  noteName: 'B - Si',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
