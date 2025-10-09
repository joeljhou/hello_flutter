class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  /// 从 JSON 创建 Album 对象
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }

  /// 转成 JSON（可选，用于上传或保存）
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'Album(userId: $userId, id: $id, title: $title)';
  }
}
