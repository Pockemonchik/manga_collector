import 'package:manga_collector/feature/domain/entities/manga_entity.dart';

class MangaModel extends MangaEntity {
  MangaModel({
    id,
    title,
  }) : super(id, title);

  factory MangaModel.fromJson(Map<String,dynamic> json) {
    return MangaModel(
        id : json['id'],
        title : json['title']);
  }

  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'title':title
    };
  }
}