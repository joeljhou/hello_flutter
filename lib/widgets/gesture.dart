import 'package:flutter/material.dart';

class GestureTest extends StatefulWidget {
  const GestureTest({super.key});

  @override
  State<GestureTest> createState() => _GestureTestState();
}

class _GestureTestState extends State<GestureTest> {
  String _message = '请尝试各种手势 👇';
  double _top = 0;   // 拖动距离（垂直）
  double _left = 0;  // 拖动距离（水平）
  double _scale = 1; // 缩放比例

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(       // 滚动视图，防止内容溢出
        scrollDirection: Axis.vertical,   // 支持垂直滚动
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,   // 垂直居中
          crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
          children: [
            // 1️⃣ 点击、双击、长按
            const Text('1️⃣ 点击 / 双击 / 长按', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            GestureDetector(              // 手势检测器
              onTap: () {
                setState(() => _message = '👉 单击事件触发！');
              },
              onDoubleTap: () {
                setState(() => _message = '💡 双击事件触发！');
              },
              onLongPress: () {
                setState(() => _message = '⏳ 长按事件触发！');
              },
              child: Container(
                width: 160,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('点我试试', style: TextStyle(fontSize: 16, color: Colors.white),),
              ),
            ),
            const SizedBox(height: 10),
            Text(_message, style: const TextStyle(fontSize: 16, color: Colors.black87)),
            const SizedBox(height: 30),

            // 2️⃣ 拖动（上下左右）
            const Text('2️⃣ 拖动示例：Drag', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 260, height: 180, color: Colors.grey[200],),  // 拖动区域背景
                Positioned(
                  top: _top,
                  left: _left,
                  child: GestureDetector(              // 手势检测器
                    onPanUpdate: (details) {           // 拖动更新
                      // 拖动更新位置
                      setState(() {
                        _left += details.delta.dx;     // 水平位置更新
                        _top += details.delta.dy;      // 垂直位置更新
                      });
                    },
                    onPanEnd: (details) {
                      setState(() => _message = '🎯 拖动结束');
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange,                     // 背景色（橙色）
                        borderRadius: BorderRadius.circular(40),  // 圆形
                      ),
                      alignment: Alignment.center,                // 内容居中
                      child: const Icon(Icons.android, color: Colors.white, size: 40),  // 图标（白色安卓标志）
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 3️⃣ 缩放（Pinch / Scale）
            const Text('3️⃣ 缩放示例：Scale', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            GestureDetector(
              onScaleUpdate: (details) {
                // 缩放更新
                setState(() {
                  _scale = details.scale.clamp(0.5, 2.0); // 限制缩放范围
                });
              },
              child: Transform.scale(
                scale: _scale,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  alignment: Alignment.center,                     // 背景色（紫色）
                  child: const Icon(Icons.favorite, color: Colors.white, size: 50),  // 图标（白色爱心标志）
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 4️⃣ 点击波纹反馈（InkWell）
            const Text('4️⃣ InkWell 点击波纹效果', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Material(
              color: Colors.teal[400],                         // 背景色（蓝绿色）
              borderRadius: BorderRadius.circular(12),         // 圆角
              clipBehavior: Clip.antiAlias,                    // 裁剪溢出部分
              child: InkWell(                                  // 波纹效果
                borderRadius: BorderRadius.circular(12),       // 圆角
                splashColor: Colors.white.withOpacity(0.5),    // 波纹颜色（白色，透明度50%）
                highlightColor: Colors.white.withOpacity(0.2), // 高亮颜色（白色，透明度20%）
                onTap: () => setState(() => _message = '🌊 InkWell 点击触发！'),
                child: Container(
                  width: 160,
                  height: 80,
                  alignment: Alignment.center,
                  child: const Text('点我有波纹', style: TextStyle(fontSize: 16, color: Colors.white),),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
