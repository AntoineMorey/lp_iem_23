import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/infrastructure/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(SpotEndpoint(GetIt.I.get<Dio>())),
      builder: (_, __) => Scaffold(
        appBar: AppBar(
          title: const Text("Liste de lieux"),
        ),
        body: Consumer<HomeViewModel>(builder: (context, viewModel, child) =>
          SafeArea(
            child: ListView.builder(
              itemCount: viewModel.spots.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        child: ListTile(
                          
                          leading: Image.network(
                            viewModel.spots[index].imageThumbnail ?? "",
                            height: 100,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const SizedBox(),
                            ),
                          title: Text(viewModel.spots[index].title ?? ""),
                          subtitle: Text(viewModel.spots[index].mainCategory?.name ?? ""),
                          trailing: const Icon(Icons.info),
                          
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      lazy: false,
    );
  }
}



