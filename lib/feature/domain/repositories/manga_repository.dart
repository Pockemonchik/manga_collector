import 'package:dartz/dartz.dart';
import 'package:manga_collector/feature/domain/entities/manga_entity.dart';
import '../../../core/error/failure.dart';

abstract class MangaRepository{
  Future<Either<Failure, List<MangaEntity>>>getAllManga(int page);
}