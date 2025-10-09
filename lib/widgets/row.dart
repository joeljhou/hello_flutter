import 'package:flutter/material.dart';

class RowTest extends StatelessWidget {
  const RowTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(       // 滚动视图，防止内容溢出
        scrollDirection: Axis.vertical,   // 支持垂直滚动
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,   // 主轴居中
          mainAxisSize: MainAxisSize.min,                // Row 只占子元素总宽度（默认是 MainAxisSize.max，占满父容器）
          children: <Widget>[
            const SizedBox(height: 20),

            // 水平居中
            Row(
              // textDirection: TextDirection.ltr,            // 从左到右布局（默认）
              mainAxisAlignment: MainAxisAlignment.center,    // 子件水平居中
              children: const [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 10),
                Text('基础 Row', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.orange),
              ],
            ),

            const SizedBox(height: 20),

            // 水平均匀分布
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,  // 主轴均匀分布
              children: const [
                Icon(Icons.home, color: Colors.blue),
                Icon(Icons.search, color: Colors.green),
                Icon(Icons.settings, color: Colors.red),
              ],
            ),

            const SizedBox(height: 20),

            // 纵轴顶部对齐
            Container(
              color: Colors.grey[200],     // 背景色
              height: 100,                 // 固定高度
              width: double.infinity,      // 宽度撑满父容器
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,     // 纵轴顶部对齐
                children: const [
                  Icon(Icons.access_alarm, size: 40, color: Colors.purple),
                  SizedBox(width: 10),
                  Text('纵轴（垂直）顶部对齐', style: TextStyle(fontSize: 18),),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Expanded 占比布局
            Row(
              children: const [
                Expanded(
                  flex: 2,
                  child: Text('左边占 2/3', textAlign: TextAlign.center,   // 文字内容居中
                    style: TextStyle(fontSize: 16, color: Colors.green),  // 文字样式
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ColoredBox(                // 背景色盒子
                    color: Colors.blue,             // 背景色（蓝色）
                    child: Center(                  // 内容居中
                      child: Text('右边占 1/3', style: TextStyle(color: Colors.white),),   // 文字样式（白色）
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Row 嵌套 Container
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,                   // 背景色（橙色）
                    borderRadius: BorderRadius.circular(8), // 圆角
                  ),
                  child: const Text('盒子1', style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(                       // 线性渐变
                      colors: [Colors.purple, Colors.deepPurpleAccent],   // 渐变颜色（紫色到深紫）
                      begin: Alignment.topLeft,                           // 渐变起点（左上角）
                      end: Alignment.bottomRight,                         // 渐变终点（右下角）
                    ),
                    borderRadius: BorderRadius.circular(8),               // 圆角
                  ),
                  child: const Text('盒子2', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
