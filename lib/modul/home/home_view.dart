// ignore_for_file: library_prefixes, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazday_kuliner/data/repository/user_repository.dart';
import 'package:lazday_kuliner/modul/home/home_bloc.dart';
import 'package:lazday_kuliner/data/model/place_model.dart' as placeModel;
import 'package:lazday_kuliner/util/helper_util.dart';
import 'package:lazday_kuliner/util/widget/progress_loading_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeBloc? homeBloc;
  @override
  void initState() {
    homeBloc = HomeBloc(RepositoryProvider.of<UserRepository>(context));
    homeBloc?.add(GetPlaceEven());
    super.initState();
  }

  Widget _buildPalceList(List<placeModel.Data> listPlace) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: listPlace.length,
          itemBuilder: (context, position) {
            return Container(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/img_thumbnail.png",
                          image: listPlace[position].image,
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/img_thumbnail.png"))),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 8),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listPlace[position].name,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listPlace[position].subDistrict.name,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black12,
                                height: 2,
                              ),
                            ),
                          ],
                        )),
                        Container(
                            child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                          ),
                          onPressed: () {},
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc!,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          print('HomeStete : state ${state.toString()}');
          if (state is HomeNotInternet) {
            toastMessage(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is Homeloading) {
            return const ProgressLoadingView();
          } else if (state is Homeloaded) {
            return Container(
              child: _buildPalceList(state.placeModel.data),
            );
          } else if (state is HomeNotInternet) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
