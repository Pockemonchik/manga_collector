import 'package:dartz/dartz.dart';
import 'package:manga_collector/core/error/failure.dart';
import 'package:manga_collector/core/usecases/usecase.dart';
import 'package:manga_collector/feature/domain/entities/manga_entity.dart';
import 'package:manga_collector/feature/domain/repositories/manga_repository.dart';

class GetAllManga extends UseCase<List<MangaEntity>,PageMangaParams> {
  final MangaRepository mangaRepository;
  GetAllManga(this.mangaRepository);
  @override
  Future<Either<Failure, List<MangaEntity>>> call (PageMangaParams params) async {
  return await mangaRepository.getAllManga(params.page);
  }
}

class PageMangaParams {
  final int page;

  PageMangaParams(this.page);

}