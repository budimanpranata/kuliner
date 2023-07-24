// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lazday_kuliner/data/model/favorite_model.dart';
import 'package:lazday_kuliner/data/repository/user_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  UserRepository? userRepository;

  FavoriteBloc(this.userRepository) : super(Favoriteloading()) {
    on<GetFavoriteEven>((event, emit) async {
      emit(Favoriteloading());
      final response = await userRepository?.GetFavorite(event.token);
      final result = response != null
          ? Favoriteloaded(response)
          : FavoriteNotLoaded('no data');
      emit(result);
    });
  }
}
