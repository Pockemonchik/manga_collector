import 'package:manga_collector/feature/domain/entities/manga_entity.dart';

abstract class MangaState {}

class MangaEmptyState extends MangaState {}

class MangaLoadingState extends MangaState {}

class MangaLoadedState extends MangaState {
  List<MangaEntity> loadedManga;
  MangaLoadedState(this.loadedManga);
}

class MangaErrorState extends MangaState{}