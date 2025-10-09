// 导入 Flutter 的 Material 组件库（包含按钮、文本、布局等常用UI组件）
import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/widgets.dart';

// 应用入口函数
void main() {
  runApp(const MyApp());
}

// 应用根组件（无状态）
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: '我的主页'),
    );
  }
}

// 首页组件（有状态）
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // 接收标题参数

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 状态类：保存页面数据并控制UI刷新
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 计数变量

  // 点击按钮时执行：让计数+1，并触发UI刷新
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 每次 setState() 被调用时，build() 会重新构建UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      // 用于展示可变化的数据（计数器）
      // body: Center(
      //   // 垂直排列的两个文本
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
      //     children: <Widget>[
      //       const Text('你已经点击按钮的次数:'), // 提示文字
      //       Text(
      //         '$_counter', // 当前计数值
      //         style: Theme.of(context).textTheme.headlineMedium, // 文字样式
      //       ),
      //     ],
      //   ),
      // ),
      // // 悬浮按钮（右下角）
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter, // 点击执行
      //   tooltip: '增加', // 长按提示
      //   child: const Icon(Icons.add), // “+” 图标
      // ),

      body:
      // const TextTest(),
      // const ImageTest(),
      // const ContainerTest(),
      // const RowTest(),
      // const FlexTest(),
      const ListviewTest(),
    );
  }
}
