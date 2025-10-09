import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  const TextTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,   // 垂直居中
        crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
        children: const <Widget>[
          Text(
            'Flutter 文本示例：样式与布局',
            textAlign: TextAlign.center,   // 居中对齐
            maxLines: 1,                   // 最多显示1行
            overflow: TextOverflow.fade,   // 超出部分淡出
            style: TextStyle(
              color: Colors.blue,             // 字体颜色
              fontSize: 18.0,                 // 字体大小
              height: 1.2,                    // 行高
              fontFamily: "Courier",          // 字体
              backgroundColor: Colors.yellow, // 背景色
              decoration: TextDecoration.underline, // 下划线
              fontWeight: FontWeight.bold,    // 加粗
              fontStyle: FontStyle.italic,    // 斜体
            ),
          ),
          SizedBox(height: 20), // 间距
          Text(
            '文本溢出演示，文字内容非常长，超过部份使用省略号以提示用户还有更多内容未显示。',
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // 超出显示省略号
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
