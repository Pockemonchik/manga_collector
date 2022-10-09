import 'dart:convert';

import 'package:manga_collector/feature/data/models/manga_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/error/exception.dart';

abstract class MangaRemoteDatasource {
  Future<List<MangaModel>> getAllManga(int page);
}

class MangaRemoteDatasourceImpl implements MangaRemoteDatasource {
  final http.Client client;

  MangaRemoteDatasourceImpl(this.client);

  @override
  Future<List<MangaModel>> getAllManga(int page) => _getMangaFromUrl("https://api.mangadex.org/manga");

  Future<List<MangaModel>> _getMangaFromUrl(String url) async{
    final response = await client.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final manga = json.decode(response.body);
      return (manga['data'] as List)
          .map((e) => MangaModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
