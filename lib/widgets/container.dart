import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  const ContainerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView( // 防止超出屏幕
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,   // 垂直居中
          crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
          children: <Widget>[

            // 基础容器：纯色背景 + margin + padding
            Container(
              width: 200,
              height: 80,
              margin: const EdgeInsets.all(10),  // 外边距
              padding: const EdgeInsets.all(10), // 内边距
              alignment: Alignment.center,       // 内容居中
              color: Colors.orange,              // 背景色
              child: const Text(
                '基础容器',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 圆角 + 阴影
            Container(
              width: 200,
              height: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(                    // 使用 BoxDecoration 来设置复杂样式
                color: Colors.lightBlueAccent,              // 背景色
                borderRadius: BorderRadius.circular(10),    // 圆角
                boxShadow: [                                // 阴影
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),    // 阴影颜色及透明度
                    spreadRadius: 2,                        // 阴影扩散半径
                    blurRadius: 5,                          // 阴影模糊半径
                    offset: const Offset(0, 3),             // 阴影偏移 (x,y）
                  ),
                ],
              ),
              child: const Text(
                '圆角 + 阴影',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 渐变背景 + 边框
            Container(
              width: 200,
              height: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(                      // 线性渐变
                  colors: [Colors.purple, Colors.deepPurpleAccent],  // 渐变颜色（紫色到深紫）
                  begin: Alignment.topLeft,                          // 渐变起点（左上角）
                  end: Alignment.bottomRight,                        // 渐变终点（右下角）
                ),
                border: Border.all(color: Colors.white, width: 3),   // 白色边框，宽度3
                borderRadius: BorderRadius.circular(12),             // 圆角
              ),
              child: const Text(
                '渐变 + 边框',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 背景图片容器
            Container(
              width: 250,
              height: 150,
              margin: const EdgeInsets.all(10),   // 外边距
              alignment: Alignment.bottomCenter,  // 内容靠下居中
              decoration: BoxDecoration(          // 使用 BoxDecoration 来设置背景图片
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/pic1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(                            // 内部文字容器
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black54,                   // 半透明黑色背景
                  borderRadius: BorderRadius.circular(8),  // 圆角
                ),
                child: const Text(
                  '背景图片容器',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            // 圆形容器（头像/按钮常用）
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,                      // 圆形
                gradient: const LinearGradient(              // 线性渐变
                  colors: [Colors.orange, Colors.redAccent], // 渐变颜色（橙色到红色）
                  begin: Alignment.topLeft,                  // 渐变起点（左上角）
                  end: Alignment.bottomRight,                // 渐变终点（右下角）
                ),
                border: Border.all(color: Colors.white, width: 4),  // 白色边框，宽度4
                boxShadow: [                                        // 阴影
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.4),       // 阴影颜色及透明度
                    blurRadius: 8,                                  // 阴影模糊半径
                    offset: const Offset(0, 4),                     // 阴影偏移 (x,y）
                  ),
                ],
              ),
              child: const Text(
                '圆形容器',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
