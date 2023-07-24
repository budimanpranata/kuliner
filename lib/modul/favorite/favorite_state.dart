part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class Favoriteloading extends FavoriteState {}

class Favoriteloaded extends FavoriteState {
  FavoriteModel favoriteModel;
  Favoriteloaded(this.favoriteModel);
}

class FavoriteNotLoaded extends FavoriteState {
  String message;
  FavoriteNotLoaded(this.message);
}
