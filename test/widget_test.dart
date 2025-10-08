// 这是一个基础的 Flutter 组件测试示例。
//
// 如果你想在测试中与组件交互，可以使用 flutter_test 包中的 WidgetTester 工具类。
// 例如：你可以模拟点击、滑动等手势操作。
// 你还可以使用 WidgetTester 来查找组件树中的子组件、读取文本内容、
// 并验证组件属性的值是否正确。

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_flutter/main.dart';

void main() {
  // 定义一个组件测试（widget test）
  // 名称为 "Counter increments smoke test"（计数器递增冒烟测试）
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 构建我们的应用程序，并触发一次绘制（frame）
    await tester.pumpWidget(const MyApp());

    // 验证计数器的初始值是否为 0
    expect(find.text('0'), findsOneWidget); // 应该能找到一个显示“0”的组件
    expect(find.text('1'), findsNothing);   // 不应该找到显示“1”的组件

    // 模拟点击 “+” 图标按钮，并触发界面重绘
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 验证计数器是否已经递增为 1
    expect(find.text('0'), findsNothing);   // 不应该再找到“0”
    expect(find.text('1'), findsOneWidget); // 应该能找到“1”
  });
}
