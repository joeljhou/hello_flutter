import 'package:flutter/material.dart';

class FlexTest extends StatelessWidget {
  const FlexTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(       // 滚动视图，防止内容溢出
        scrollDirection: Axis.vertical,     // 支持垂直滚动
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // 1️⃣ 水平 Flex (相当于 Row)
            const Text('1️⃣ 水平 Flex (Row)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,                          // 水平布局
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,    // 主轴均匀分布
              crossAxisAlignment: CrossAxisAlignment.center,       // 纵轴居中对齐
              children: const [
                Icon(Icons.home, color: Colors.blue),
                Icon(Icons.search, color: Colors.green),
                Icon(Icons.settings, color: Colors.red),
              ],
            ),
            const SizedBox(height: 20),

            // 2️⃣ 垂直 Flex (相当于 Column)
            const Text('2️⃣ 垂直 Flex (Column)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[200],
              height: 200,
              child: Flex(
                direction: Axis.vertical,                          // 垂直布局
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴两端对齐
                crossAxisAlignment: CrossAxisAlignment.start,      // 纵轴起点对齐
                children: const [
                  Icon(Icons.access_alarm, size: 40, color: Colors.purple),
                  Icon(Icons.ac_unit, size: 40, color: Colors.teal),
                  Icon(Icons.accessibility, size: 40, color: Colors.orange),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 3️⃣ Horizontal Expanded 占比布局
            const Text('3️⃣ Horizontal Expanded 占比布局', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: const [
                Expanded(
                  flex: 2,
                  child: ColoredBox(
                    color: Colors.green,
                    child: Center(
                      child: Text('2/3', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ColoredBox(
                    color: Colors.blue,
                    child: Center(
                      child: Text('1/3', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 4️⃣ Vertical Expanded 占比布局
            const Text('4️⃣ Vertical Expanded 占比布局', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[300],
              height: 200,
              child: Flex(
                direction: Axis.vertical,
                children: const [
                  Expanded(
                    flex: 1,
                    child: ColoredBox(
                      color: Colors.orange,
                      child: Center(
                        child: Text('上部 1/3', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ColoredBox(
                      color: Colors.purple,
                      child: Center(
                        child: Text('下部 2/3', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 5️⃣ 嵌套 Flex
            const Text('5️⃣ 嵌套 Flex', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.redAccent,
                    alignment: Alignment.center,
                    child: const Text('左边', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                    alignment: Alignment.center,
                    child: const Text('右边', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}
