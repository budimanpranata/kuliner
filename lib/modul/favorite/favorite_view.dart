// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazday_kuliner/data/repository/user_repository.dart';
import 'package:lazday_kuliner/modul/favorite/favorite_bloc.dart';
import 'package:lazday_kuliner/data/model/favorite_model.dart' as favoriteModel;
import 'package:lazday_kuliner/util/widget/progress_loading_view.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  FavoriteBloc? favoriteBloc;

  @override
  void initState() {
    favoriteBloc = FavoriteBloc(RepositoryProvider.of<UserRepository>(context));
    favoriteBloc
        ?.add(GetFavoriteEven('313|lzUoNs0OdIvWvU0Rhv8aDPiDFsoyVe0Ufp3DmsyN'));
    super.initState();
  }

  Widget _buildFavoriteList(List<favoriteModel.Data> listFavorite) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: listFavorite.length,
          itemBuilder: (context, position) {
            return Container(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/img_thumbnail.png",
                              image: listFavorite[position].image,
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
                      ],
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
                                  listFavorite[position].name,
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
                                  listFavorite[position].subDistrict.name,
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
      create: (context) => favoriteBloc!,
      child: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          print('HomeStete : state ${state.toString()}');
        },
        builder: (context, state) {
          if (state is Favoriteloading) {
            return const ProgressLoadingView();
          } else if (state is Favoriteloaded) {
            return Container(
              child: _buildFavoriteList(state.favoriteModel.data),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
