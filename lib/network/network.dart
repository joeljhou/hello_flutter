import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'data.dart';

class HttpTest extends StatefulWidget {
  const HttpTest({super.key});

  @override
  State<HttpTest> createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  bool _loading = false;
  String _responseText = "";
  Album? _album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _loading ? null : _fetchData,
              child: Text(_loading ? "加载中..." : "获取网络数据"),
            ),
            const SizedBox(height: 20),
            Text(
              "原始响应：\n${_responseText.isEmpty ? "暂无数据" : _responseText}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Text(
              "解析后的 title：\n${_album?.title ?? "暂无数据"}",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  /// 异步请求网络数据
  Future<void> _fetchData() async {
    setState(() {
      _loading = true;
      _responseText = "正在请求...";
    });

    try {
      // 创建 HttpClient
      final client = HttpClient();

      // 请求 URL
      final request = await client.getUrl(
        Uri.parse("https://jsonplaceholder.typicode.com/albums/2"),
      );

      // 等待响应
      final response = await request.close();

      // 读取响应内容
      final body = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        // 解析 JSON 数据
        _album = Album.fromJson(jsonDecode(body));
        _responseText = body;
      } else {
        _responseText = "请求失败：状态码 ${response.statusCode}";
      }

      client.close();
    } catch (e) {
      _responseText = "请求异常：$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
