import 'package:flutter/material.dart';

class ListviewTest extends StatelessWidget {
  const ListviewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical, // 垂直滚动（默认）
        children: <Widget>[
          // 1️⃣ 基础文本列表项
          const Text('1️⃣ 基础 ListView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          Container(
            color: Colors.blue[50],
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.star, color: Colors.orange),  // Icon
                  title: Text('列表项 1'),                           // 主标题
                  subtitle: Text('副标题 1'),                        // 副标题
                ),
                Divider(height: 1, color: Colors.grey),
                ListTile(
                  leading: Icon(Icons.star, color: Colors.orange),
                  title: Text('列表项 2'),
                  subtitle: Text('副标题 2'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 2️⃣ 带图片的列表项
          const Text('2️⃣ 带图片的 ListTile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          Container(
            color: Colors.green[50],
            child: Column(
              children: const [
                ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/images/flutter.png'),),
                  title: Text('本地图片'),
                  subtitle: Text('使用 AssetImage 加载本地图片'),
                ),
                Divider(height: 1, color: Colors.grey),
                ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage('http://img.geekyspace.cn/pictures/2025/202510082255759.png'),),
                  title: Text('网络图片'),
                  subtitle: Text('使用 NetworkImage 加载网络图片'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 3️⃣ 横向滚动 ListView
          const Text('3️⃣ 横向滚动 ListView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal, // 横向滚动
              children: List.generate(5, (index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),    // 右侧间距
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],  // 循环颜色
                    borderRadius: BorderRadius.circular(8),    // 圆角
                  ),
                  alignment: Alignment.center,                 // 文字居中
                  child: Text('Box ${index + 1}', style: const TextStyle(color: Colors.white),),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          // 4️⃣ ListView.builder 动态生成
          const Text('4️⃣ ListView.builder 动态构建', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,                       // 列表项数量
              itemExtent: 82,                     // 每项高度（固定高度可提升性能）
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5), // 垂直间距
                  decoration: BoxDecoration(
                    color: Colors.amber[100],                      // 背景色（琥珀色）
                    borderRadius: BorderRadius.circular(8),        // 圆角
                  ),
                  child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.amber[(index + 1) * 200 % 900],
                      child: Text('${index + 1}'),
                    ),
                    title: Text('动态项 ${index + 1}'),                  // 标题
                    subtitle: const Text('使用 ListView.builder 创建'),  // 副标题
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // 5️⃣ 分组 + 分割线
          const Text('5️⃣ 带分组标题的 ListView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          Container(
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text('热门功能', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const Divider(height: 1, color: Colors.grey),
                const ListTile(leading: Icon(Icons.message, color: Colors.blue), title: Text('聊天'),),
                const ListTile(leading: Icon(Icons.camera_alt, color: Colors.redAccent), title: Text('相机'),),
                const Divider(height: 1, color: Colors.grey),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text('系统设置', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const ListTile(leading: Icon(Icons.settings, color: Colors.grey), title: Text('设置中心'),),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
