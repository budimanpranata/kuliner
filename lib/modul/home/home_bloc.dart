// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:lazday_kuliner/data/remote/conectivity_service.dart';
import 'package:lazday_kuliner/data/repository/user_repository.dart';

import '../../data/model/place_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserRepository? userRepository;
  var connectivity = ConnectivityService();

  HomeBloc(this.userRepository) : super(Homeloading()) {
    connectivity.connectivityStream.stream.listen((event) {
      print('connectivityStream: event ${event.toString()}');
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent('No internet Connection'));
      } else {
        add(GetPlaceEven());
      }
    });
    on<GetPlaceEven>((event, emit) async {
      emit(Homeloading());
      final response = await userRepository?.getPlace();
      final result =
          response != null ? Homeloaded(response) : HomeNotLoaded('no data');
      emit(result);
    });

    on<NoInternetEvent>((event, emit) async {
      emit(HomeNotInternet(event.message));
    });
  }
}
