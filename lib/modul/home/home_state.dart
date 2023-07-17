// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class Homeloading extends HomeState {}

class Homeloaded extends HomeState {
  PlaceModel placeModel;
  Homeloaded(this.placeModel);
}

class HomeNotLoaded extends HomeState {
  String message;
  HomeNotLoaded(this.message);
}

class HomeNotInternet extends HomeState {
  String message;
  HomeNotInternet(this.message);
}
