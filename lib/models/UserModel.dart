import 'package:flutter_keep/models/NoteModel.dart';

class UserModel {
  String? sId;
  String? name;
  String? email;
  List<NoteModel>? notes;
  String? createdAt;
  String? token;

  UserModel(
      {this.sId,
      this.name,
      this.email,
      this.notes,
      this.createdAt,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    if (json['notes'] != null) {
      notes = <NoteModel>[];
      json['notes'].forEach((v) {
        notes!.add(new NoteModel.fromJson(v));
      });
    } else {
      notes = [];
    }
    createdAt = json['createdAt'] ?? '';
    token = json['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.notes != null) {
      data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['token'] = this.token;
    return data;
  }
}
