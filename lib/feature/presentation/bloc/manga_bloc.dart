import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_collector/feature/domain/usecases/get_all_manga.dart';
import 'package:manga_collector/feature/presentation/bloc/manga_state.dart';

import 'manga_event.dart';

class MangaBloc extends Bloc<MangaEvent, MangaState> {
  final GetAllManga getAllManga;

  MangaBloc(this.getAllManga) : super(MangaEmptyState()) {
    on<MangaLoadEvent>((event, emit) async {
      emit(MangaLoadingState());
      try {
        final failureOrLoadedMangaList = await getAllManga(PageMangaParams(20));
        failureOrLoadedMangaList.fold((error) => emit(MangaErrorState()),
            (manga) {
          emit(MangaLoadedState(manga));
        });
      } catch (_) {
        emit(MangaErrorState());
      }
    });
  }
}
