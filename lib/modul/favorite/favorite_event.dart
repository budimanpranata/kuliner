part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteEven extends FavoriteEvent {
  String token;
  GetFavoriteEven(this.token);
  @override
  List<Object> get props => [token];
}
