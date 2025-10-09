import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Demo',
      home: Scaffold(
        body: ListView(
          children: const [
            ImageSection(),
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),
      ),
    );
  }
}

// 1️⃣ 图片部分
class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/pic1.png',
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }
}

// 2️⃣ 标题部分
class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold,),),
                SizedBox(height: 4),
                Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const SizedBox(width: 4),
          const Text('41'),
        ],
      ),
    );
  }
}

// 3️⃣ 按钮部分
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Icons.call, 'CALL'),
        _buildButtonColumn(Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w400,),),
      ],
    );
  }
}

// 4️⃣ 文本描述部分
class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
            'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
            'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
            'and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. '
            'Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}
