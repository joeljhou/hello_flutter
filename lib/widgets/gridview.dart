import 'package:flutter/material.dart';

class GridViewTest extends StatelessWidget {
  const GridViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(       // 滚动视图，防止内容溢出
        scrollDirection: Axis.vertical,   // 支持垂直滚动
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,   // 垂直居中
          crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
          children: <Widget>[
            // 1️⃣ 基础 GridView.count
            const Text('1️⃣ GridView.count（固定列数）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 3,                    // 每行3列（固定列数）
                crossAxisSpacing: 10,                 // 列间距
                mainAxisSpacing: 10,                  // 行间距
                padding: const EdgeInsets.all(8),     // 内边距
                children: List.generate(6, (index) {  // 生成6个格子（静态）
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],  // 循环颜色
                      borderRadius: BorderRadius.circular(8),                    // 圆角
                    ),
                    child: Text('Item ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 16),),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // 2️⃣ GridView.extent
            const Text('2️⃣ GridView.extent（固定最大宽度）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.extent(
                maxCrossAxisExtent: 120,             // 每个格子的最大宽度，自动计算列数
                crossAxisSpacing: 10,                // 列间距
                mainAxisSpacing: 10,                 // 行间距
                childAspectRatio: 2,                 // 宽高比：宽/高（默认1.0，正方形）
                padding: const EdgeInsets.all(8),    // 内边距
                children: List.generate(8, (index) { // 生成8个格子（静态）
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.teal[(index + 1) * 100 % 900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Box ${index + 1}', style: const TextStyle(color: Colors.white),),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // 3️⃣ GridView.builder 动态生成
            const Text('3️⃣ GridView.builder（动态生成）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.builder(
                itemCount: 10,                      // 元素数量
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,                // 每行4列
                  crossAxisSpacing: 8,              // 列间距
                  mainAxisSpacing: 8,               // 行间距
                ),
                itemBuilder: (context, index) {     // 动态构建每个格子
                  return Container(
                    alignment: Alignment.center,    // 内容居中
                    decoration: BoxDecoration(
                      color: Colors.amber[(index + 1) * 100 % 900],  // 循环颜色
                      borderRadius: BorderRadius.circular(6),        // 圆角
                    ),
                    child: Text('格子 ${index + 1}', style: const TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 4️⃣ 带图片的网格
            const Text('4️⃣ 带图片的网格（图片 + 文字）', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,                     // 每行2列（固定列数）
                crossAxisSpacing: 10,                  // 列间距
                mainAxisSpacing: 10,                   // 行间距
                padding: const EdgeInsets.all(8),      // 内边距
                children: List.generate(4, (index) {   // 生成4个格子（静态）
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),  // 圆角
                      image: DecorationImage(                   // 背景图片
                        image: AssetImage('assets/images/pic${(index % 4) + 1}.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,          // 文字底部居中
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),  // 圆角
                        color: Colors.black38,                    // 半透明黑色遮罩
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text('图片 ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // 5️⃣ 自定义比例网格
            const Text('5️⃣ SliverGridDelegateWithFixedCrossAxisCount + 自定义比例', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,                // 每行3列
                  childAspectRatio: 0.75,           // 宽高比：宽/高（自定义比例）
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {     // 动态构建每个格子
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple[(index + 1) * 100 % 900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('比例 ${index + 1}', style: const TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 6️⃣ 混合内容：图标 + 标题
            const Text('6️⃣ 图标 + 标题布局', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: GridView.count(
                crossAxisCount: 3,                  // 每行3列
                crossAxisSpacing: 10,               // 列间距
                mainAxisSpacing: 10,                // 行间距
                padding: const EdgeInsets.all(8),   // 内边距
                children: const [
                  _GridIcon(icon: Icons.home, text: '首页', color: Colors.blue),
                  _GridIcon(icon: Icons.search, text: '搜索', color: Colors.green),
                  _GridIcon(icon: Icons.settings, text: '设置', color: Colors.orange),
                  _GridIcon(icon: Icons.favorite, text: '收藏', color: Colors.redAccent),
                  _GridIcon(icon: Icons.message, text: '消息', color: Colors.purple),
                  _GridIcon(icon: Icons.person, text: '我的', color: Colors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 自定义图标网格项组件
class _GridIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _GridIcon({required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(                            // 背景装饰
        color: color.withOpacity(0.1),                      // 半透明背景色
        borderRadius: BorderRadius.circular(12),            // 圆角
        border: Border.all(color: color.withOpacity(0.4)),  // 边框
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,        // 垂直居中
        children: [
          Icon(icon, color: color, size: 36),               // 图标
          const SizedBox(height: 6),                        // 间距
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
