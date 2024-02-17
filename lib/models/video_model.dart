import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  String userName;
  String id;
  String uid;
  String vidUrl;
  String thumbnail;
  String caption;
  List likes;
  int commentCount;
  String dp;
  Video({
    required this.userName,
    required this.id,
    required this.uid,
    required this.vidUrl,
    required this.thumbnail,
    required this.caption,
    required this.likes,
    required this.commentCount,
    required this.dp,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'id': id,
      'uid': uid,
      'vidUrl': vidUrl,
      'thumbnail': thumbnail,
      'caption': caption,
      'likes': likes,
      'commentCount': commentCount,
      'dp': dp,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
        userName: map['userName'] as String,
        id: map['id'] as String,
        uid: map['uid'] as String,
        vidUrl: map['vidUrl'] as String,
        thumbnail: map['thumbnail'] as String,
        caption: map['caption'] as String,
        commentCount: map['commentCount'] as int,
        dp: map['dp'] as String,
        likes: List.from(
          (map['likes'] as List),
        ));
  }

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
