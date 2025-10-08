import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,   // 垂直居中
        crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
        children: const <Widget>[
          // 本地图片
          Image(
            image: AssetImage("images/flutter.png"),  // 从项目资源中加载图片
            width: 200.0,                             // 图片显示宽度
            height: 200.0,                            // 图片显示高度
            fit: BoxFit.contain,                      // 保持图片宽高比，完整显示图片
            alignment: Alignment.center,              // 图片在容器中居中对齐
          ),
          SizedBox(height: 20), // 间距
          // 网络图片
          Image(
            image: NetworkImage("http://img.geekyspace.cn/pictures/2025/202510082255759.png",),
            width: 350.0,                             // 图片显示宽度
            fit: BoxFit.cover,                        // 按比例裁剪并填充整个容器
            alignment: Alignment.center,              // 图片在容器中居中对齐
          ),
        ],
      ),
    );
  }
}
