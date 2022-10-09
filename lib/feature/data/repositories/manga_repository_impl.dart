import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/manga_entity.dart';
import '../../domain/repositories/manga_repository.dart';
import '../datasources/manga_local_datasource.dart';
import '../datasources/manga_remote_datasourse.dart';
import '../models/manga_model.dart';

class MangaRepositoryImpl implements MangaRepository {
  final MangaRemoteDataSource remoteDataSource;
  final MangaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MangaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MangaEntity>>> getAllManga(int page) async {
    return await _getManga(() {
      return remoteDataSource.getAllManga(page);
    });
  }

  Future<Either<Failure, List<MangaModel>>> _getManga(
      Future<List<MangaModel>> Function() getMangas) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteManga = await getMangas();
        localDataSource.mangaToCache(remoteManga);
        return Right(remoteManga);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localManga = await localDataSource.getMangaFromCache();
        return Right(localManga);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}