import 'dart:convert';

import 'package:manga_collector/feature/data/models/manga_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exception.dart';

abstract class MangaLocalDatasource{
  Future<List<MangaModel>>getMangaFromCache();
  void mangaToCache(List<MangaModel> manga);
}
const CACHED_MANGA_LIST = 'CACHED_MANGA_LIST';

// тут надо подобрать внутренне хранилище
class MangaLocalDatasourceImpl implements MangaLocalDatasource{
  final SharedPreferences sharedPreferences;

  MangaLocalDatasourceImpl(this.sharedPreferences);
  @override
  Future<List<MangaModel>> getMangaFromCache() {
    final jsonMangasList =
    sharedPreferences.getStringList(CACHED_MANGA_LIST);
    if (jsonMangasList!.isNotEmpty) {
      print('Get Manga from C?.che: ${jsonMangasList.length}');
      return Future.value(jsonMangasList
          .map((manga) => MangaModel.fromJson(json.decode(manga)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>  mangaToCache(List<MangaModel> manga) {
    final List<String> jsonMangasList =
    manga.map((manga) => json.encode(manga.toJson())).toList();

    sharedPreferences.setStringList(CACHED_MANGA_LIST, jsonMangasList);
    print('Persons to write Cache: ${jsonMangasList.length}');
    return Future.value(jsonMangasList);
  }

}