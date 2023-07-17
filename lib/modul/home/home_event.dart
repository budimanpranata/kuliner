part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetPlaceEven extends HomeEvent {
  @override
  List<Object> get props => [];
}

class NoInternetEvent extends HomeEvent {
  String message;
  NoInternetEvent(this.message);

  @override
  List<Object> get props => [message];
}
