class NoteModel {
  String? title;
  String? desc;
  String? userId;
  bool? done;
  List<Tags>? tags;
  String? sId;
  String? createdAt;
  int? iV;

  NoteModel(
      {this.title,
      this.desc,
      this.userId,
      this.done,
      this.tags,
      this.sId,
      this.createdAt,
      this.iV});

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    userId = json['userId'];
    done = json['done'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    sId = json['_id'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['userId'] = this.userId;
    data['done'] = this.done;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Tags {
  String? sId;
  String? name;
  String? userId;
  int? iV;

  Tags({this.sId, this.name, this.userId, this.iV});

  Tags.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    userId = json['userId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    return data;
  }
}
